import 'package:flutter/material.dart';

// ignore: camel_case_types
class DrawerPaint_doc_list extends CustomPainter {
  final Color curveColor;
  final Paint curvePaint;

  DrawerPaint_doc_list({
    this.curveColor = Colors.pink,
  }) : curvePaint = Paint()
          ..color = curveColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var diameter = size.height / 3;

   // path.moveTo(35, 0);
    //path.relativeCubicTo(25, diameter * 0.1, -150, diameter / 2, 0, diameter);
    //path.relativeCubicTo(30, diameter * 0.6, -15, diameter / 2, 0, diameter);
    path.relativeCubicTo(35, diameter * 0.0, -100, diameter * 0.0, 0, diameter);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, curvePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
