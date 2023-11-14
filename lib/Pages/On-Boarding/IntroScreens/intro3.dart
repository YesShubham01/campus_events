import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
            "Get Started with Login",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Lottie.network(
                "https://lottie.host/908bdd1f-49a4-4a45-af1d-2357d06ea198/aZlmKcbhtp.json"),
          ),
        ],
      ),
    );
  }
}
