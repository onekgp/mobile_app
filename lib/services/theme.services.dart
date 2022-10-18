import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;

  ThemeMode get themeMode => _mode;

  toggleTheme(bool isDark) {
    _mode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
