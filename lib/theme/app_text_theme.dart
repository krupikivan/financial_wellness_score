import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme get black => baseTheme(
        const TextStyle(
          color: Colors.black,
        ),
      );
  static TextTheme get secondary => baseTheme(
        const TextStyle(
          color: Colors.white,
        ),
      );
  static TextTheme get white => baseTheme(
        const TextStyle(
          color: Colors.white,
        ),
      );
  static TextTheme get primary => baseTheme(
        const TextStyle(
          color: Color(0xFF001C95),
        ),
      );

  static TextTheme get light => baseTheme(
        const TextStyle(
          color: Color(0xFF708797),
        ),
      );
  static TextTheme get dark => baseTheme(
        const TextStyle(
          color: Color(0xFF4D6475),
        ),
      );

  static const fontFamily = 'Work Sans';
  static const extraBoldFont = '$fontFamily ExtraBold';
  static const boldFont = '$fontFamily Bold';
  static const lightFont = '$fontFamily Light';
  static const extraLightFont = '$fontFamily ExtraLight';
  static const mediumFont = '$fontFamily Medium';
  static const regularFont = '$fontFamily Regular';
  static const thinFont = '$fontFamily Thin';

  /// 12px
  static const double _xs = 12;

  /// 14px
  static const double _s = 14;

  /// 16px
  static const double _m = 16;

  /// 18px
  static const double _l = 18;

  /// 20px
  static const double _xl = 20;

  /// 24px
  static const double _xxl = 24;

  static TextTheme baseTheme(TextStyle baseText) => TextTheme(
        // XS / subtitle
        titleMedium: baseText.copyWith(
          fontSize: _l,
          fontFamily: regularFont,
          fontWeight: FontWeight.w400,
        ),
        // LG / subtitle--semibold
        titleLarge: baseText.copyWith(
          fontSize: _xl,
          fontFamily: regularFont,
          fontWeight: FontWeight.w600,
        ),
        // XS/headingSmall
        headlineSmall: baseText.copyWith(
          fontSize: _xl,
          fontFamily: regularFont,
          fontWeight: FontWeight.w500,
        ),
        // XS / paragraph
        bodyMedium: baseText.copyWith(
          fontSize: _s,
          fontFamily: regularFont,
          fontWeight: FontWeight.w400,
        ),
        // XS / description
        bodySmall: baseText.copyWith(
          fontSize: _xs,
          fontFamily: regularFont,
          fontWeight: FontWeight.w400,
        ),
        // LG / headingSmall
        headlineMedium: baseText.copyWith(
          fontSize: _xxl,
          fontFamily: regularFont,
          fontWeight: FontWeight.w500,
        ),
        // Button
        displayMedium: baseText.copyWith(
          fontSize: _m,
          fontFamily: regularFont,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        // XS / paragraph--semibold
        bodyLarge: baseText.copyWith(
          fontSize: _s,
          fontFamily: regularFont,
          fontWeight: FontWeight.w600,
        ),
      );
}
