import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsLoaded>(_onSettingsLoaded);
    on<ThemeSelected>(_onThemeSelected);
    on<LanguageSelected>(_onLanguageSelected);
  }

  void _onSettingsLoaded(
    SettingsLoaded event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    var currentTheme = prefs.getString('selectedTheme') ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

    var currentLanguage = prefs.getString('selectedLanguage') ?? 'russian';

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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTheme', event.theme);

    emit(state.copyWith(currentTheme: event.theme));
  }

  void _onLanguageSelected(
    LanguageSelected event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', event.language);

    emit(
      state.copyWith(currentLanguage: event.language),
    );
  }
}
