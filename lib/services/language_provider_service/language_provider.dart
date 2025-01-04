import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale('en');
  static const String _keyLocale = 'locale';

  LanguageProvider() {
    _loadFromPrefs();
  }

  Locale get locale => _locale;

  void changeLocale(Locale newLocale) async {
    _locale = newLocale;
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localeString = prefs.getString(_keyLocale);
    if (localeString != null) {
      _locale = Locale(localeString);
      notifyListeners();
    }
  }

  Future<void> _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyLocale, _locale.languageCode);
  }
}