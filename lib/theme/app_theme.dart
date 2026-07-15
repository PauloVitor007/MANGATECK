import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Classe responsável por centralizar todas as definições de tema do MangaTracker.
///
/// Paleta principal:
///   - Fundo: Preto profundo (#000000)
///   - Cards/Superfícies: Cinza grafite escuro (#121212)
///   - Cor de destaque (Neon): Rosa neon (#FF1493)
///   - Texto primário: Branco (#FFFFFF)
///   - Texto secundário: Cinza claro (#9E9E9E)
class AppTheme {
  AppTheme._();

  // ─── Paleta de Cores ───────────────────────────────────────────────
  static const Color backgroundBlack = Color(0xFF000000);
  static const Color cardGraphite = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color neonPink = Color(0xFFFF1493);
  static const Color neonPinkLight = Color(0xFFFF69B4);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color dividerColor = Color(0xFF2A2A2A);
  static const Color inputFill = Color(0xFF1E1E1E);

  // ─── Sombra Neon para botões e destaques ───────────────────────────
  static List<BoxShadow> neonGlow({double blurRadius = 16, double opacity = 0.45}) {
    return [
      BoxShadow(
        color: neonPink.withValues(alpha: opacity),
        blurRadius: blurRadius,
        spreadRadius: 1,
      ),
    ];
  }

  // ─── Gradiente de destaque ──────────────────────────────────────────
  static const LinearGradient neonGradient = LinearGradient(
    colors: [neonPink, Color(0xFFFF69B4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ─── ThemeData principal ────────────────────────────────────────────
  static ThemeData get darkTheme {
    final textTheme = GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundBlack,
      colorScheme: const ColorScheme.dark(
        surface: backgroundBlack,
        primary: neonPink,
        secondary: neonPinkLight,
        onPrimary: textPrimary,
        onSurface: textPrimary,
        onSecondary: textPrimary,
        outline: dividerColor,
      ),

      // ─── AppBar ─────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),

      // ─── Card ───────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: cardGraphite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: dividerColor.withValues(alpha: 0.5)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      ),

      // ─── Bottom Navigation ──────────────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardGraphite,
        selectedItemColor: neonPink,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: textTheme.labelSmall,
      ),

      // ─── InputDecoration ────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        hintStyle: textTheme.bodyMedium?.copyWith(color: textSecondary),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: dividerColor.withValues(alpha: 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: neonPink, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),

      // ─── Elevated Button ────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonPink,
          foregroundColor: textPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // ─── TextTheme ─────────────────────────────────────────────────
      textTheme: textTheme.copyWith(
        headlineLarge: textTheme.headlineLarge?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(color: textPrimary),
        bodyMedium: textTheme.bodyMedium?.copyWith(color: textSecondary),
        labelLarge: textTheme.labelLarge?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),

      // ─── Divider ───────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 0.5,
      ),

      // ─── Tab Bar ───────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        indicatorColor: neonPink,
        labelColor: neonPink,
        unselectedLabelColor: textSecondary,
        labelStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: textTheme.labelLarge,
        dividerColor: Colors.transparent,
      ),
    );
  }
}
