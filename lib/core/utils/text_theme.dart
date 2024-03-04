import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTextTheme = TextTheme(
  headlineLarge: GoogleFonts.plusJakartaSans(
      fontSize: 82, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headlineMedium: GoogleFonts.plusJakartaSans(
      fontSize: 51, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headlineSmall:
      GoogleFonts.plusJakartaSans(fontSize: 41, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.plusJakartaSans(
      fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  titleMedium:
      GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.w400),
  titleSmall: GoogleFonts.lemonada(
      fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  bodySmall: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
);
