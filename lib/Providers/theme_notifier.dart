import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  MaterialColor? _primarySwatch;

  MaterialColor? get primarySwatch => _primarySwatch;

  set primarySwatch(MaterialColor? color) {
    _primarySwatch = color;
    notifyListeners(); // Notify listeners when the primarySwatch changes
  }
}
