import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLight=Color(0xff5d9cec);
  static Color backGroundLight=Color(0xffDFECDB);
  static Color greenColor=Color(0xff61E757);
  static Color redColor=Color(0xffEC4B4B);
  static Color blackColor=Color(0xff383838);
  static Color whiteColor=Color(0xffffffff);
  static Color grayColor=Color(0xffc8c9cb);
  static Color backGroundDark=Color(0xff060e1e);
  static Color blackDark=Color(0xff141922);
  static ThemeData ligthTheme=ThemeData(
    scaffoldBackgroundColor: backGroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight
  )
  );
}