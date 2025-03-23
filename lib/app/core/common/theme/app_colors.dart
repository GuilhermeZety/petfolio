import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/color_extension.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';

export 'package:petfolio/app/core/common/extensions/color_extension.dart';

class AppColors {
  AppColors._();

  static const Color primary = brown_700;
  static Color get primaryDark => brown_700.darken(0.1);
  static Color get primaryLight => brown_700.lighten(0.2);
  static const Color secondary = brown_900;
  static const Color tertiary = brown_100;

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF020912);

  static const Color grey_50 = Color(0xFFF9FAFB);
  static const Color grey_100 = Color(0xFFF3F4F6);
  static const Color grey_200 = Color(0xFFE5E7EB);
  static const Color grey_300 = Color(0xFFD1D5DB);
  static const Color grey_400 = Color(0xFF9CA3AF);
  static const Color grey_500 = Color(0xFF6B7280);
  static const Color grey_600 = Color(0xFF4B5563);
  static const Color grey_700 = Color(0xFF4E4E56);
  static const Color grey_800 = Color(0xFF434349);
  static const Color grey_900 = Color(0xFF2A3138);
  static const Color grey_950 = Color(0xFF21262B);

  static const Color brown_700 = Color(0xFF996A56);
  // static const Color green_600 = Color(0xFF029E61);
  static const Color brown_900 = Color(0xFF1E1E1D);
  static const Color brown_100 = Color(0xFFF6EEE3);

  static const Color red_400 = Color(0xFFD26A6B);
  static const Color red_500 = Color(0xFFAC0101);

  static LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primary.darken(0.2)],
  );
  static LinearGradient gradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDark, primaryDark.darken(0.2)],
  );
  static LinearGradient gradientTheme(BuildContext context) =>
      context.isDark ? gradientDark : gradient;
}
