import 'package:campus_events/Pages/Home/homepage.dart';
import 'package:campus_events/Pages/Profile%20/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  final _inActiveTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white.withOpacity(0.8),
  );

  final _activeTextStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: Colors.white.withOpacity(0.8),
  );
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          colorLineSelected: Colors.deepPurple,
          baseStyle: _inActiveTextStyle,
          selectedStyle: _activeTextStyle,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Profile",
          colorLineSelected: Colors.deepPurple,
          baseStyle: _inActiveTextStyle,
          selectedStyle: _activeTextStyle,
        ),
        const ProfilePage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.deepPurple.shade200,
      initPositionSelected: 0,
    );
  }
}
