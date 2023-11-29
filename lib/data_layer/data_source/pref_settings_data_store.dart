import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_test_app/data_layer/data_source/settings_data_store.dart';

class PrefsSettingsDataSource implements SettingsDataSource {
  @override
  Future<Map<String, String>> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    var currentTheme = prefs.getString('selectedTheme') ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness.name;
    var currentLanguage = prefs.getString('selectedLanguage') ?? 'russian';

    return {'theme': currentTheme, 'language': currentLanguage};
  }

  @override
  Future<void> updateSettings({String? theme, String? language}) async {
    if (theme != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedTheme', theme);
    }
    if (language != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedLanguage', language);
    }
  }
}
