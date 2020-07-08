import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CurvePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final colors = [Hexcolor("#39ACFC"), Hexcolor("#33B8F3")];
    final stops = [0.0, 1.0];
    final gradient = LinearGradient(colors: colors, stops: stops);
    final paints = Paint()..shader = gradient.createShader(shapeBounds);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 2, size.height * 0.4, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paints);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}