import 'package:bondly/auth/invite_selection_page.dart';

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
      home: InviteSelectionScreen(),
    );
  }
}

// https://chatgpt.com/c/68256c0a-de18-8010-8310-eda733c5a8b9
