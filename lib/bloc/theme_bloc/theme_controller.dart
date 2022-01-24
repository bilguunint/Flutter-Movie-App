import 'package:flutter/material.dart';
import 'theme_service.dart';

class ThemeController with ChangeNotifier {
  ThemeController(this._themeService);

  final ThemeService _themeService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _themeService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _themeService.updateThemeMode(newThemeMode);
  }
}