abstract class SettingsDataSource {
  Future<Map<String, String>> loadSettings();
  Future<void> updateSettings({String? theme, String? language});
}
