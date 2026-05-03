import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.montserratAlternates(
          fontSize: 40,
        ),
        titleMedium: GoogleFonts.montserratAlternates(
          fontSize: 35,
        ),
      ),
    );
  }
}
