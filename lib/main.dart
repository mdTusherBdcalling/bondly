import 'package:bondly/colors.dart';
import 'package:bondly/intro/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColour, // background white
    primaryColor: AppColors.buttonColour,
    colorScheme: ColorScheme.light(
      primary: AppColors.buttonColour,
      onPrimary: AppColors.whiteColour,
      background: AppColors.whiteColour,
      onBackground: AppColors.blackColour,
      surface: Colors.white,
      onSurface: AppColors.blackColour,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.blackColour),
      titleMedium: TextStyle(color: AppColors.blackColour),
      titleSmall: TextStyle(color: AppColors.blackColour),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColour,
      iconTheme: IconThemeData(color: AppColors.blackColour),
      titleTextStyle: TextStyle(
        color: AppColors.blackColour,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColour, // dark bg
    primaryColor: AppColors.buttonColour,
    colorScheme: ColorScheme.dark(
      primary: AppColors.buttonColour,
      onPrimary: AppColors.whiteColour,
      background: AppColors.primaryBlue,
      onBackground: AppColors.whiteColour,
      surface: AppColors.primaryBlueLight,
      onSurface: AppColors.whiteColour,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: AppColors.whiteColour),
      titleLarge: TextStyle(color: AppColors.whiteColour),
      titleSmall: TextStyle(color: AppColors.whiteColour),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      iconTheme: IconThemeData(color: AppColors.whiteColour),
      titleTextStyle: TextStyle(
        color: AppColors.whiteColour,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'System Theme Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}

//https://chatgpt.com/c/68258433-0b40-8010-b10e-3a5c5934b571
