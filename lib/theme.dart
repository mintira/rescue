import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.kanit(),
      ),
    );
  }