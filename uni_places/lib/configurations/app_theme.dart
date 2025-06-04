import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 56, 142, 60),
  surface: const Color.fromARGB(255, 35, 45, 35),
  primary: const Color.fromARGB(255, 67, 160, 71),
  secondary: const Color.fromARGB(255, 102, 187, 106),
);

final appTextTheme = GoogleFonts.nunitoTextTheme().copyWith(
  bodyMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16.0),
  bodyLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20.0),
  titleSmall: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18.0),
  titleMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 22.0),
  titleLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 28.0),
);

final appTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: appColorScheme.surface,
  colorScheme: appColorScheme,
  textTheme: appTextTheme,
);
