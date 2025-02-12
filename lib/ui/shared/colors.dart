import 'package:flutter/material.dart';

class AppColors {
  // static Color mainColor = const Color(0xFF5A5FD0);
  static Color mainColor = const Color(0xFFEFBF04);
  static Color error = Colors.red.shade600;
  static Color success = Colors.green.shade600;
  static Color textColor = const Color(0xFF525253);
  static const Color redColor= Color(0xFFDD222B);
  static Color whiteColor = const Color.fromRGBO(252, 255, 255, 1);
  static Color grayColor = const Color(0xFF929295);
  static const Color blackColor = Colors.black;
  static const Color greenColor = Colors.green;
  static LinearGradient mainGradientColor = LinearGradient(
    colors: [
      mainColor,
      whiteColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
