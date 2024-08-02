//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.7600000);
    path_0.cubicTo(0, size.height * 0.6700000, 0, size.height * 0.5000000, 0,
        size.height * 0.5000000);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.8000000);
    path_0.cubicTo(
        size.width * 0.5000000,
        size.height * 0.8000000,
        size.width * 0.3200000,
        size.height * 0.9000000,
        size.width * 0.2800000,
        size.height * 0.9200000);
    path_0.cubicTo(
        size.width * 0.2520000,
        size.height * 0.9320000,
        size.width * 0.2200000,
        size.height * 0.9400000,
        size.width * 0.1800000,
        size.height * 0.9400000);
    path_0.cubicTo(
        size.width * 0.1500000,
        size.height * 0.9400000,
        size.width * 0.1200000,
        size.height * 0.9300000,
        size.width * 0.09000000,
        size.height * 0.9160000);
    path_0.cubicTo(
        size.width * 0.05000000,
        size.height * 0.8960000,
        size.width * 0.02000000,
        size.height * 0.8660000,
        size.width * 0.006000000,
        size.height * 0.8260000);
    path_0.cubicTo(0, size.height * 0.8060000, 0, size.height * 0.7800000, 0,
        size.height * 0.7600000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffde4632).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width, size.height * 0.2400000);
    path_1.cubicTo(size.width, size.height * 0.3300000, size.width,
        size.height * 0.5000000, size.width, size.height * 0.5000000);
    path_1.lineTo(size.width * 0.5000000, size.height * 0.2000000);
    path_1.cubicTo(
        size.width * 0.5000000,
        size.height * 0.2000000,
        size.width * 0.7200000,
        size.height * 0.1000000,
        size.width * 0.7560000,
        size.height * 0.08000000);
    path_1.cubicTo(
        size.width * 0.7800000,
        size.height * 0.06600000,
        size.width * 0.8100000,
        size.height * 0.06000000,
        size.width * 0.8400000,
        size.height * 0.06000000);
    path_1.cubicTo(
        size.width * 0.8700000,
        size.height * 0.06000000,
        size.width * 0.9000000,
        size.height * 0.07000000,
        size.width * 0.9200000,
        size.height * 0.08000000);
    path_1.cubicTo(
        size.width * 0.9600000,
        size.height * 0.1000000,
        size.width * 0.9800000,
        size.height * 0.1300000,
        size.width * 0.9940000,
        size.height * 0.1700000);
    path_1.cubicTo(size.width, size.height * 0.1900000, size.width,
        size.height * 0.2200000, size.width, size.height * 0.2400000);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff5f69a2).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(0, size.height * 0.5000000);
    path_2.lineTo(0, size.height * 0.2100000);
    path_2.cubicTo(
        0,
        size.height * 0.1860000,
        size.width * 0.006000000,
        size.height * 0.1640000,
        size.width * 0.01800000,
        size.height * 0.1440000);
    path_2.cubicTo(
        size.width * 0.04000000,
        size.height * 0.1100000,
        size.width * 0.08000000,
        size.height * 0.08000000,
        size.width * 0.1260000,
        size.height * 0.06600000);
    path_2.cubicTo(
        size.width * 0.1660000,
        size.height * 0.05600000,
        size.width * 0.2100000,
        size.height * 0.05600000,
        size.width * 0.2500000,
        size.height * 0.06400000);
    path_2.cubicTo(
        size.width * 0.2700000,
        size.height * 0.06800000,
        size.width * 0.2940000,
        size.height * 0.08000000,
        size.width * 0.3340000,
        size.height * 0.1000000);
    path_2.cubicTo(
        size.width * 0.4000000,
        size.height * 0.1360000,
        size.width * 0.5000000,
        size.height * 0.2000000,
        size.width * 0.5000000,
        size.height * 0.2000000);
    path_2.lineTo(0, size.height * 0.5000000);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff269a74).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width, size.height * 0.5000000);
    path_3.lineTo(size.width, size.height * 0.7920000);
    path_3.cubicTo(
        size.width,
        size.height * 0.8160000,
        size.width * 0.9940000,
        size.height * 0.8380000,
        size.width * 0.9820000,
        size.height * 0.8580000);
    path_3.cubicTo(
        size.width * 0.9600000,
        size.height * 0.8920000,
        size.width * 0.9200000,
        size.height * 0.9220000,
        size.width * 0.8740000,
        size.height * 0.9360000);
    path_3.cubicTo(
        size.width * 0.8340000,
        size.height * 0.9460000,
        size.width * 0.7900000,
        size.height * 0.9460000,
        size.width * 0.7500000,
        size.height * 0.9380000);
    path_3.cubicTo(
        size.width * 0.7300000,
        size.height * 0.9340000,
        size.width * 0.7060000,
        size.height * 0.9220000,
        size.width * 0.6660000,
        size.height * 0.9020000);
    path_3.cubicTo(
        size.width * 0.6000000,
        size.height * 0.8660000,
        size.width * 0.5000000,
        size.height * 0.8000000,
        size.width * 0.5000000,
        size.height * 0.8000000);
    path_3.lineTo(size.width, size.height * 0.5000000);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xfff09d30).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
