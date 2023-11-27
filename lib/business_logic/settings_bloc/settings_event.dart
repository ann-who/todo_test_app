part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class SettingsLoaded extends SettingsEvent {
  SettingsLoaded();
}

class ThemeSelected extends SettingsEvent {
  final String theme;

  ThemeSelected({required this.theme});
}

class LanguageSelected extends SettingsEvent {
  final String language;

  LanguageSelected({required this.language});
}
