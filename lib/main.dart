import 'package:campus_events/Pages/Hidden%20Drawer/custom_drawer.dart';
import 'package:campus_events/Pages/Login/loginpage.dart';
import 'package:campus_events/Pages/On-Boarding/on_boarding_screen.dart';
import 'package:campus_events/Provider/my_provider.dart';
import 'package:campus_events/Provider/party_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => MyProvider())),
        ChangeNotifierProvider(create: ((context) => PartyProvider())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        // home: const HiddenDrawer(),
        home: const OnBoardingScreen(),
      ),
    );
  }
}
