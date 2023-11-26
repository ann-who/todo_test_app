import 'package:flutter/material.dart';

import 'package:todo_test_app/resources/app_colors.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainOrange,
      foregroundColor: AppColors.lightOrange,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return AppColors.lightBlue.withOpacity(0.2);
          } else if (states.contains(MaterialState.error)) {
            return Colors.red.withOpacity(0.1);
          } else {
            return Colors.grey.withOpacity(0.1);
          }
        },
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.blue),
      ),
      suffixIconColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return AppColors.blue;
          } else {
            return Colors.grey;
          }
        },
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightOrange,
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.darkBlue,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColors.darkBlue,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      labelMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12.0,
        color: Colors.grey,
      ),
    ),
  );
}
