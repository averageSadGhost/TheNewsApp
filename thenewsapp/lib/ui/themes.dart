import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    // ignore: deprecated_member_use
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.black,
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    // ignore: deprecated_member_use
    backgroundColor: Colors.grey[900],
    brightness: Brightness.dark,
    primaryColorDark: Colors.white,
  );
}
