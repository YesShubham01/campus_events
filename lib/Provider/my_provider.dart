import 'package:campus_events/Objects/post_details.dart';
import 'package:campus_events/Objects/user_deatils.dart';
import 'package:campus_events/Services/FireAuth%20Service/authentication.dart';
import 'package:campus_events/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';

// i want to make a provider here. MyProvider.

class MyProvider with ChangeNotifier {
  bool isLoggedIn;
  UserDetail userDetail = UserDetail();

  // sample post
  PostDetails post = PostDetails();

  MyProvider({
    this.isLoggedIn = false,
  });

  void setSamplePost() async {
    post = await FireStore.getMananAuditionDetails();
    notifyListeners();
  }

  // splash page uses this.
  void setUserData() async {
    userDetail = await FireStore.getUserDataFromFirestore();
    notifyListeners();
  }

  // splash page uses this.
  void setLoginState() {
    isLoggedIn = Authenticate.isLoggedIn();
    notifyListeners();
  }

  //login page uses this
  void loginSuccessful() {
    setLoginState();
  }
}
