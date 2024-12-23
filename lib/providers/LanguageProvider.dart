import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  bool _isGerman = false;

  bool get isGerman => _isGerman;

  void toggleLanguage() {
    _isGerman = !_isGerman;
    notifyListeners();
  }
}
