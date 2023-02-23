import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
    primaryColor: Colors.black,
    // ignore: deprecated_member_use
    backgroundColor: Colors.grey[100],
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.white,
    // ignore: deprecated_member_use
    backgroundColor: Colors.grey[900],
    brightness: Brightness.dark,
  );
}
