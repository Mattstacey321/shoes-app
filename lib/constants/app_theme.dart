import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
      bodyText2: GoogleFonts.lexendDeca(color: Colors.black),
      bodyText1: GoogleFonts.lexendDeca(color: Colors.black)
    )
  );
  static ThemeData darkTheme = ThemeData.dark();
}
