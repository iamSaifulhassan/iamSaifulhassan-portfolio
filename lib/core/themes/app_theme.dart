import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF4CAF50);
  static const Color accentColor = Color(0xFFFF6B6B);
  static const Color backgroundColor = Color(0xFF0A0E27);
  static const Color surfaceColor = Color(0xFF1E2749);
  static const Color cardColor = Color(0xFF252B48);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textHint = Color(0xFF78849E);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, Color(0xFF9C27B0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [surfaceColor, cardColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Color(0x336C63FF),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ];

  // Theme Data
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,      textTheme: GoogleFonts.outfitTextTheme().apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 8,
          shadowColor: primaryColor.withOpacity(0.3),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: textHint),
      ),
    );
  }
  // Text Styles
  static TextStyle get headingStyle => GoogleFonts.outfit(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        height: 1.2,
      );
  static TextStyle get subHeadingStyle => GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      );

  static TextStyle get bodyStyle => GoogleFonts.poppins(
        fontSize: 16,
        color: textSecondary,
        height: 1.6,
      );

  static TextStyle get captionStyle => GoogleFonts.poppins(
        fontSize: 14,
        color: textHint,
      );
}
