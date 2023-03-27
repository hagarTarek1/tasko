import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var rect =Offset.zero&size;
    Paint paint=Paint();
    Path path=Path();
    paint.shader= LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors:[
          //Color.fromARGB(100, 80, 150,150),
          //Color.fromRGBO(12, 250, 108, 0.8),
          Color.fromRGBO(200, 220, 208, 0.8),
          Color.fromRGBO(52, 118, 79, 0.8),
          //Color.fromRGBO(20, 49, 31, 0.8),
          //Color.fromARGB(39, 245, 191 ,8),
          //Color.fromARGB(120, 200, 80, 90),
        ]
    ).createShader(rect);
    path.lineTo(0,size.height - size.height/8);
    path.conicTo(size.width/5, size.height, size.width, size.height-size.height/5,9);
    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Color.fromRGBO(20, 49, 31, 0.8), 10, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}