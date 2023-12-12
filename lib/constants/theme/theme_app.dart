import 'package:flutter/material.dart';

///Tema da aplicação
class ThemeApp {
  static final lightTheme = ThemeData(
    primaryColor: const Color(0xFFF5F5DC),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF5F5DC),
      secondary: Color(0xFF665837),
      tertiary: Color(0xFF472906),
    ),
  );
}
