import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = "isDarkModeTheme";

  _saveThemeMode(bool isDarkModeTheme) => _box.write(_key, isDarkModeTheme);

  bool _loadThemeMode() => _box.read<bool>(_key) ?? false;

  ThemeMode get getTheme => _loadThemeMode() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeMode() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeMode(!_loadThemeMode());
  }
}
