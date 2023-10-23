import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData getTheme() {
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: darkBrown,
        fontFamily: GoogleFonts.lacquer().fontFamily,
      ),
      displayMedium: TextStyle(
        color: darkBrown,
        fontFamily: GoogleFonts.lacquer().fontFamily,
      ),
      displaySmall: TextStyle(color: darkBrown),
      headlineMedium: TextStyle(color: darkBrown),
      headlineSmall: TextStyle(
        color: darkBrown,
        fontFamily: GoogleFonts.lacquer().fontFamily,
      ),
      titleLarge: TextStyle(color: darkBrown),
      bodySmall: TextStyle(color: darkBrown),
      bodyLarge: TextStyle(color: darkBrown),
      titleMedium: TextStyle(color: darkBrown),
      titleSmall: TextStyle(color: darkBrown),
      bodyMedium: TextStyle(color: darkBrown),
      labelSmall: TextStyle(color: darkBrown),
      labelLarge: TextStyle(color: darkBrown),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.brown.shade400),
      color: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: Colors.brown,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: Colors.brown,
        ),
      ).titleLarge,
    ),
  );
}
