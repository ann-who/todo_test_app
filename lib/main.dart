import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/tasks_page.dart';
import 'package:todo_test_app/resources/app_colors.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TaskBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainOrange),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.all(16.0),
            ),
            backgroundColor: const MaterialStatePropertyAll<Color>(
              AppColors.blue,
            ),
            shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) {
              return states.contains(MaterialState.focused)
                  ? AppColors.lightBlue.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1);
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: AppColors.blue),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.darkBlue,
        ),
      ),
      home: const TasksPage(),
    );
  }
}
