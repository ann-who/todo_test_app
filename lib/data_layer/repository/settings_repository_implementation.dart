import 'package:todo_test_app/data_layer/data_source/settings_data_store.dart';
import 'package:todo_test_app/data_layer/repository/settings_repository.dart';

class SettingsRepositoryImplementation implements SettingsRepository {
  final SettingsDataSource settingsDataSource;

  const SettingsRepositoryImplementation({required this.settingsDataSource});

  @override
  Future<Map<String, String>> loadSettings() async {
    var settings = await settingsDataSource.loadSettings();

    return settings;
  }

  @override
  Future<void> updateSettings({String? theme, String? language}) async {
    if (theme != null) {
      await settingsDataSource.updateSettings(theme: theme);
    }
    if (language != null) {
      await settingsDataSource.updateSettings(language: language);
    }
  }
}
