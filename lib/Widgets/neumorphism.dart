import 'package:flutter/material.dart';

class NeumorphisimContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const NeumorphisimContainer(
      {super.key, this.height = 200, this.width = 300, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(10),
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
      child: child,
    );
  }
}
