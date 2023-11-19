import 'package:campus_events/Pages/Hidden%20Drawer/custom_drawer.dart';
import 'package:campus_events/Pages/On-Boarding/on_boarding_screen.dart';
import 'package:campus_events/Provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLogin = false;
  @override
  void initState() {
    super.initState();

    final myProvider = context.read<MyProvider>();
    myProvider.setLoginState();
    myProvider.setUserData();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        checkLoginAndContinue();
      },
    );
  }

  checkLoginAndContinue() {
    isLogin = context.read<MyProvider>().isLoggedIn;
    if (isLogin) {
      print("---> Home page");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HiddenDrawer(),
      ));
    } else {
      print("---> Login page");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade400,
        body: Center(child: Lottie.asset("images/loading_lottie.json")));
  }
}
