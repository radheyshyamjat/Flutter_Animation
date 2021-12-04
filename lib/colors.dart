import 'package:flutter/material.dart';

class CustomColor{
  CustomColor._();
  Color customColor(int color){
    int cl2 = 0xff+color;
    var col = Color(cl2);
    return col;
  }
// icons
  static const Color primary = Color(0xFF1a2839);
  static const Color cardBorder = Color(0xFF35485c);
  static const Color circleBorder = Color(0xFFd59534);
  static const Color cardFillColor = Color(0xFF6263c0);
  static const Color cardBorderColor = Color(0xff6263c0);
  static const Color darkLight = Color(0x4300335f);
  static const Color darkPrimary = Color(0xff00335f);
  static const Color lightPink = Color(0xff71558e);
  static const Color primaryRed = Color(0xffe31e25);
  static const Color primaryRedLight = Color(0xffFF3F80);
}
