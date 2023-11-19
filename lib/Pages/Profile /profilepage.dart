import 'package:campus_events/Objects/user_deatils.dart';
import 'package:campus_events/Provider/my_provider.dart';
import 'package:campus_events/Widgets/animated_neumorphism.dart';
import 'package:campus_events/Widgets/neumorphism.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/glassmorphism.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
    UserDetail userData = context.watch<MyProvider>().userDetail;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(149, 117, 205, 1),
          body: ListView(
            children: [
              const SizedBox(height: 180),
              _buildInfoCard(title: 'Phone Number', content: userData.number),
              _buildInfoCard(title: 'Email', content: userData.email),
              _buildInfoCard(title: 'Roll Number', content: userData.rollno),
              _buildInfoCard(title: 'Branch', content: userData.branch),
              _buildInfoCard(
                title: 'Graduation Year',
                content: userData.graduationyear,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            children: [
              const SizedBox(
                height: 120,
                width: 120,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Glass(
                    height: 60,
                    child: Text(
                      userData.name,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontFamily: 'Horizon',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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

  Widget _buildInfoCard({required String title, required String content}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: NeumorphisimContainer(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(height: 5),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
