// 사용자 설정 값

import 'package:flutter/material.dart';

/// 앱 전역 설정 정보를 담는 모델
class AppSetting {
  /// 테마 모드 (라이트 / 다크 / 시스템)
  final ThemeMode themeMode;

  AppSetting({
    required this.themeMode,
  });

  /// 기본 설정값 (앱 최초 실행 시 사용)
  factory AppSetting.initial() {
    return AppSetting(
      themeMode: ThemeMode.system,
    );
  }

  /// 기존 설정에서 일부만 바꿀 수 있게 하는 메서드
  AppSetting copyWith({
    ThemeMode? themeMode,
  }) {
    return AppSetting(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  /// JSON → AppSetting
  factory AppSetting.fromJson(Map<String, dynamic> json) {
    return AppSetting(
      themeMode: _themeModeFromString(json['themeMode'] ?? 'system'),
    );
  }

  /// AppSetting → JSON
  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.name, // 'light', 'dark', 'system'
    };
  }

  /// 문자열을 ThemeMode로 변환
  static ThemeMode _themeModeFromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
