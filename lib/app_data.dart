import 'package:flutter/material.dart';

const development = true;

const String scribblyBackend = development == true
    ? "http://10.0.2.2:3200"
    : "https://scribbly-backend.herokuapp.com";

List<int> colors = [
  0xffEEDD82,
  0xfff032e6,
  0xfffabebe,
  0xff008080,
  0xffe6beff,
  0xff9a6324,
  0xfffffac8,
  0xff800000,
  0xffaaffc3,
  0xff808000,
  0xffffd8b1,
  0xff000075,
  0xff808080,
  // 0xffffffff,
  0xff3cb44b,
  0xff000000,
  0xfff58231,
  0xffe6194b,
  0xff911eb4,
  0xff46f0f0,
  0xffffe119,
  0xff4363d8,
  0xffdd82ee,
  0xffbcf60c,
  0xff1A1A1A,
];

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    fontFamily: "Sebino",
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromRGBO(231, 238, 241, 0.938),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: const InputDecorationTheme(),
    appBarTheme: const AppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    //
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.white),
      headline6: TextStyle(fontFamily: "Sebino", color: Color(0xFF1A1A3F)),
    ),
  );

  static final ThemeData dark = ThemeData(
    fontFamily: "Sebino",
    brightness: Brightness.dark,
    primaryColor: const Color(0xff1D212B),
    scaffoldBackgroundColor: const Color(0xff4a4a58),
    iconTheme: const IconThemeData(color: Color(0xff1D212B)),
    //
    textTheme: const TextTheme(headline6: TextStyle(fontFamily: "Sebino")),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xff4a4a58),
    ),
  );
}
