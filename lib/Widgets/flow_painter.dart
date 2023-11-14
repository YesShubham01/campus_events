import 'package:flutter/material.dart';

class FlowPainter extends CustomPainter {
  final BuildContext context;
  final ValueNotifier<double> notifier;
  final GlobalKey target;
  final List<Color> colors;

  RenderBox? _renderBox;

  FlowPainter({
    required this.context,
    required this.notifier,
    required this.target,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final screen = MediaQuery.of(context).size;
    _renderBox ??= target.currentContext?.findRenderObject() as RenderBox?;
    if (notifier.value == null) return;
    final page = notifier.value.floor();
    final animatorVal = notifier.value - page;
    final targetPos = _renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
    final xScale = screen.height * 8, yScale = xScale / 2;
    var curvedVal = Curves.easeInOut.transformInternal(animatorVal);
    final reverseVal = 1 - curvedVal;

    Paint buttonPaint = Paint(), bgPaint = Paint();
    Rect buttonRect, bgRect = Rect.fromLTWH(0, 0, screen.width, screen.height);

    if (animatorVal < 0.5) {
      bgPaint.color = colors[page % colors.length];
      buttonPaint.color = colors[(page + 1) % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx - (xScale * curvedVal),
        targetPos.dy - (yScale * curvedVal),
        targetPos.dx + (_renderBox?.size.width ?? 0) * reverseVal,
        targetPos.dy + (_renderBox?.size.height ?? 0) + (yScale * curvedVal),
      );
    } else {
      bgPaint.color = colors[page % colors.length];
      buttonPaint.color = colors[(page + 1) % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx + (_renderBox?.size.width ?? 0) * reverseVal,
        targetPos.dy - yScale * reverseVal,
        targetPos.dx + (_renderBox?.size.width ?? 0) + xScale * reverseVal,
        targetPos.dy + (_renderBox?.size.height ?? 0) + yScale * reverseVal,
      );
    }

    canvas.drawRect(bgRect, bgPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(buttonRect, Radius.circular(screen.height)),
      buttonPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
