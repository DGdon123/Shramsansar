import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,

  // fontFamily: 'uniform',
  primaryColor: const Color(0xFFE8F2FC),
  backgroundColor: const Color(0xFFFFFFFF),
  brightness: Brightness.light,
  cardColor: Colors.white,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Color(0xFFF5F5F7), fontSize: 24.0),
  ),
);
