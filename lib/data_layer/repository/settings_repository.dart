abstract class SettingsRepository {
  Future<Map<String, String>> loadSettings();
  Future<void> updateSettings({String? theme, String? language});
}
