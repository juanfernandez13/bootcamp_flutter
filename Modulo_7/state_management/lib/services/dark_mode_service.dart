import 'package:flutter/material.dart';

class DarkModeService extends ChangeNotifier {
  bool _isDarkMode = false;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  bool get isDarkMode => _isDarkMode; 
}
