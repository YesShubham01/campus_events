import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Glass extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  const Glass({
    super.key,
    this.height = 50,
    this.width = 300,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        width: width,
        height: height,
        borderRadius: 12,
        blur: 20,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.2),
          ],
        ),
        child: child);
  }
}
