import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
    textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff4F5A69)),
        titleMedium: TextStyle(fontSize: 10, color: Color(0xff79828B)),
        titleLarge: TextStyle(fontSize: 13, color: Color(0xffA3A3A3)),
        bodySmall: TextStyle(fontSize: 22, color: Colors.white),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        titleSmall: TextStyle(fontSize: 14, color: Colors.white)),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
