import 'package:campus_events/Widgets/animated_neumorphism.dart';
import 'package:campus_events/Widgets/glassmorphism.dart';
import 'package:campus_events/Widgets/post.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool flexYourAnimationSkills = false;

  @override
  void initState() {
    super.initState();

    // Delay the change of topMargin after 300 milliseconds
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        flexYourAnimationSkills = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Colors.deepPurple.shade300,
            body: const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Glass(
                        height: 60,
                        child: Text(
                          "Name Here",
                          style: TextStyle(
                              fontSize: 26.0,
                              fontFamily: 'Horizon',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          left: flexYourAnimationSkills ? 20 : 40,
          top: flexYourAnimationSkills ? 20 : 40,
          child: AnimatedNeumorphisimContainer(
            topMargin: flexYourAnimationSkills ? 10 : 175,
            circle: flexYourAnimationSkills ? true : false,
            height: 180,
          ),
        ),
      ],
    );
  }
}
