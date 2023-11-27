import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_test_app/business_logic/settings_bloc/settings.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/presentation_layer/authorization_page/authorization_page.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/tasks_page.dart';
import 'package:todo_test_app/resources/app_theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()..add(SettingsLoaded()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          locale: Locale(state.currentLanguage == 'russian' ? 'ru' : 'en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: state.currentTheme == 'light'
              ? AppTheme().lightTheme
              : AppTheme().darkTheme,
          home: const AuthorizationPage(),
        );
      },
    );
  }
}
