import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme {
  static ThemeData themeData() => ThemeData(
        navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: Colors.white,
        ),
        primaryColor: const Color(0xFF001C95),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF001C95),
          linearMinHeight: 12,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              AppTextTheme.white.displayMedium,
            ),
            minimumSize:
                WidgetStateProperty.all(const Size(double.infinity, 48)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20),
            ),
            elevation: WidgetStateProperty.all<double>(0),
            foregroundColor: WidgetStateColor.resolveWith(
              (s) => Colors.white,
            ),
            backgroundColor: WidgetStateColor.resolveWith(
              (s) => const Color(0xFF001C95),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              AppTextTheme.primary.displayMedium,
            ),
            minimumSize:
                WidgetStateProperty.all(const Size(double.infinity, 48)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            side: WidgetStateProperty.all(
              const BorderSide(
                color: Color(0xFF001C95),
                width: 2,
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20),
            ),
            elevation: WidgetStateProperty.all<double>(0),
            foregroundColor: WidgetStateColor.resolveWith(
              (s) => const Color(0xFF001C95),
            ),
            backgroundColor: WidgetStateColor.resolveWith(
              (s) => Colors.white,
            ),
          ),
        ),
      );
}
