part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({
    required String currentTheme,
    required String currentLanguage,
  }) = _SettingsState;
}
