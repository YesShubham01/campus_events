import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          const Text(
            "Register for events in One Tap!",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Lottie.network(
                "https://lottie.host/aa62c5c1-bbde-495d-89b6-3cdd1ec62f25/eRJE1Y1uOe.json"),
          ),
        ],
      ),
    );
  }
}
