import 'package:bondly/home/budget_overview_page.dart';
import 'package:bondly/home/custom_drawer.dart';
import 'package:bondly/home/daily_activity_page.dart';
import 'package:bondly/home/daily_activity_page2.dart';
import 'package:bondly/home/goal_achived.dart';
import 'package:bondly/home/goal_overview.dart';
import 'package:bondly/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'System Theme Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          ThemeMode.light, // <-- This respects system theme (dark or light)
      home: GoalOverviewPage(),
    );
  }
}

//https://chatgpt.com/c/68258433-0b40-8010-b10e-3a5c5934b571
