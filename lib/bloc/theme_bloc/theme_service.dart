import 'package:flutter/material.dart';

class ThemeService {
  Future<ThemeMode> themeMode() async => ThemeMode.dark;
  Future<void> updateThemeMode(ThemeMode theme) async {}
}
