import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const instance = AppTheme._();
  static const primaryColor = Color(0xFFF1D493);
  static const secondaryColor = Color(0xFF9F844F);

  const AppTheme._();

  ThemeData get darkTheme {
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
        onSecondary: Colors.black,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(),
      ),
    );
  }
}
