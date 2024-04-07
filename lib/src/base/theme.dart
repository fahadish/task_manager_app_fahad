import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

sealed class AppTheme {
  static ThemeData get light {
    return ThemeData(
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(46),
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.blue,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      scaffoldBackgroundColor: AppColors.white,
      textTheme: GoogleFonts.manropeTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}

sealed class AppColors {
  static const white = Color(0xFFF9F8FD);
  static const black = Color(0xFF292D32);
  static const blue = Color(0xFF0063B0);
}
