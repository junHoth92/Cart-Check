// 테마, 알림 등 앱 설정 상태 관리

import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

// 초기화, 저장 등은 SharedPreferences 연동으로 확장 가능
}