import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_test_app/data_layer/repository/settings_repository.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({required this.settingsRepository})
      : super(const SettingsState()) {
    on<SettingsLoaded>(_onSettingsLoaded);
    on<ThemeSelected>(_onThemeSelected);
    on<LanguageSelected>(_onLanguageSelected);
  }

  void _onSettingsLoaded(
    SettingsLoaded event,
    Emitter<SettingsState> emit,
  ) async {
    var settings = await settingsRepository.loadSettings();

    var currentTheme = settings['theme']!;
    var currentLanguage = settings['language']!;

    emit(
      state.copyWith(
        currentTheme: currentTheme,
        currentLanguage: currentLanguage,
      ),
    );
  }

  void _onThemeSelected(
    ThemeSelected event,
    Emitter<SettingsState> emit,
  ) async {
    await settingsRepository.updateSettings(theme: event.theme);

    emit(state.copyWith(currentTheme: event.theme));
  }

  void _onLanguageSelected(
    LanguageSelected event,
    Emitter<SettingsState> emit,
  ) async {
    await settingsRepository.updateSettings(language: event.language);

    emit(state.copyWith(currentLanguage: event.language));
  }
}
