part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({
    @Default('') String currentTheme,
    @Default('') String currentLanguage,
  }) = _SettingsState;
}
