import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_test_app/data_layer/data_source/pref_settings_data_store.dart';
import 'package:todo_test_app/data_layer/repository/settings_repository_implementation.dart';
import 'firebase_options.dart';

import 'package:todo_test_app/business_logic/authentification_bloc/authentification.dart';
import 'package:todo_test_app/business_logic/settings_bloc/settings.dart';
import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/data_layer/data_source/firebase_tasks_data_source.dart';
import 'package:todo_test_app/data_layer/repository/tasks_repository_implementation.dart';
import 'package:todo_test_app/presentation_layer/authorization_page/authorization_page.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/tasks_page.dart';
import 'package:todo_test_app/resources/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HomeWidget.registerBackgroundCallback(updateTasksCountCallback);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthentificationBloc(),
        ),
        BlocProvider(
          create: (context) => TaskBloc(
            tasksRepository: TasksRepositoryImplementation(
              tasksDataSource: FirebaseTasksDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(
            settingsRepository: SettingsRepositoryImplementation(
              settingsDataSource: PrefsSettingsDataSource(),
            ),
          )..add(SettingsLoaded()),
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
    return BlocListener<TaskBloc, TaskState>(
      listenWhen: (previous, current) =>
          previous.newTasksCounter != current.newTasksCounter,
      listener: (context, state) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('taskCount', state.newTasksCounter);

        updateTasksCountCallback();
      },
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(state.currentLanguage == 'russian' ? 'ru' : 'en'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: state.currentTheme == 'light'
                ? AppTheme().lightTheme
                : AppTheme().darkTheme,
            home: BlocBuilder<AuthentificationBloc, AuthentificationState>(
              buildWhen: (previous, current) =>
                  previous.isAuthorized != current.isAuthorized,
              builder: (context, state) {
                return StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      User? user = snapshot.data;
                      if (user == null) {
                        return AuthorizationPage();
                      } else {
                        context.read<TaskBloc>().add(TasksListLoaded());
                        return const TasksPage();
                      }
                    }
                    return const CircularProgressIndicator();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

updateTasksCountCallback([Uri? uri]) async {
  final prefs = await SharedPreferences.getInstance();
  var counter = prefs.getInt('taskCount') ?? 0;

  await HomeWidget.saveWidgetData<int>('task_count', counter);
  await HomeWidget.updateWidget(
    name: 'AppWidgetProvider',
    androidName: 'AppWidgetProvider',
    qualifiedAndroidName: 'com.example.todo_test_app.AppWidgetProvider',
  );
}
