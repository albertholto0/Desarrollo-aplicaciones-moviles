import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 35, 125, 31),
  surface: const Color.fromARGB(255, 125, 226, 120),
);

final appTextTheme = GoogleFonts.nunitoTextTheme().copyWith(
  bodyMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16.0),
  bodyLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20.0),
  titleSmall: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18.0),
  titleMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 22.0),
  titleLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 28.0),
);
