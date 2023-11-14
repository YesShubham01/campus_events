import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
            "See what's happening in YMCA",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Lottie.network(
                "https://lottie.host/f757f4cf-1f4f-4021-add2-d5d47736a582/2rrEQkwgo5.json"),
          ),
        ],
      ),
    );
  }
}
