import 'package:flutter/material.dart';

class AnimatedNeumorphisimContainer extends StatelessWidget {
  final double height;
  final double width;
  final bool circle;
  final double topMargin;

  final Widget? child;

  const AnimatedNeumorphisimContainer(
      {super.key,
      this.height = 200,
      this.width = 300,
      this.child,
      this.circle = false,
      this.topMargin = 20});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(top: topMargin),
      duration: const Duration(seconds: 1),
      height: circle ? 120 : height,
      width: circle ? 120 : width,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(circle ? width / 2 : 10),
        boxShadow: const [
          // dark shadow in bottom
          BoxShadow(
            offset: Offset(4, 4),
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 1,
          ),

          // light shadow in top
          BoxShadow(
            offset: Offset(-4, -4),
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: 1,
          )
        ],
      ),
    );
  }
}
