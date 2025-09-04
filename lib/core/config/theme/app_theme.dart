import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simi_inmobiliaria/core/config/constans/constants.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getTheme() => ThemeData(
    ///* General
    useMaterial3: true,
    colorSchemeSeed: SimiColors.colorSeed,
    // primaryColor: Colors.colorSeed,

    ///* Texts
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Verdana',
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Verdana',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(fontFamily: 'Verdana', fontSize: 20),
      bodyLarge: TextStyle(fontFamily: 'Verdana', fontSize: 18),
      bodyMedium: TextStyle(fontFamily: 'Verdana', fontSize: 16),
      bodySmall: TextStyle(fontFamily: 'Verdana', fontSize: 14),
      // titleSmall: GoogleFonts.raleway().copyWith(fontSize: 20),
      // bodyLarge: GoogleFonts.raleway().copyWith(fontSize: 18),
      // bodyMedium: GoogleFonts.raleway().copyWith(fontSize: 16),
      // bodySmall: GoogleFonts.raleway().copyWith(fontSize: 14),
    ),

    ///* Scaffold Background Color
    scaffoldBackgroundColor: SimiColors.scaffoldBackgroundColor,

    ///* Buttons
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.raleway().copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    ),

    ///* AppBar
    appBarTheme: AppBarTheme(
      color: SimiColors.scaffoldBackgroundColor,
      titleTextStyle: GoogleFonts.raleway().copyWith(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
