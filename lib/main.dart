import 'package:flutter/material.dart';
import 'package:todo_test_app/resources/app_colors.dart';

import 'presentation_layer/tasks_page/tasks_page.dart';

void main() {
  runApp(const MyApp());
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
