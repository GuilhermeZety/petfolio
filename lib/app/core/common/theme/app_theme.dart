import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  //   //SingleTon
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  factory AppTheme() => AppTheme._instance;

  static ThemeData light = ThemeData(
    fontFamily: AppFonts.defaultFont,
    primarySwatch: AppColors.primary.toMaterialColor(),
    scaffoldBackgroundColor: AppColors.grey_50,
    canvasColor: AppColors.white,
    primaryColor: AppColors.white,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: AppColors.primary,
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.changeOpacity(0.2),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.grey_700,
        letterSpacing: 0.4,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      displayMedium: TextStyle(color: AppColors.grey_600, letterSpacing: 0.4),
      bodySmall: TextStyle(color: AppColors.grey_400, letterSpacing: 0.4),
      bodyMedium: TextStyle(color: AppColors.grey_500, letterSpacing: 0.4),
      bodyLarge: TextStyle(
        color: AppColors.grey_800,
        letterSpacing: 0.4,
        fontWeight: AppFonts.bold,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: AppColors.grey_900,
        letterSpacing: 0.4,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        color: AppColors.grey_900,
        letterSpacing: 0.4,
        fontWeight: AppFonts.bold,
        fontSize: 40,
      ),
      titleSmall: TextStyle(
        color: AppColors.grey_900,
        letterSpacing: 0.4,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      hourMinuteColor: AppColors.grey_100,
      dayPeriodTextColor: AppColors.red_400,
      hourMinuteTextColor: WidgetStateColor.resolveWith(
        (states) =>
            states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.grey_500,
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.white,
      dayStyle: TextStyle(color: AppColors.grey_500),
      surfaceTintColor: Colors.transparent,
      headerHelpStyle: TextStyle(
        color: AppColors.grey_600,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ).copyWith(
    canvasColor: AppColors.grey_200,
    primaryColor: AppColors.grey_200,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      primaryContainer: AppColors.grey_100,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.white,
      surface: AppColors.white,
      tertiaryContainer: AppColors.grey_200,
      tertiary: AppColors.tertiary,
      onSecondaryContainer: AppColors.grey_100,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.grey_300,
      thickness: 1,
      space: 0,
      indent: 0,
      endIndent: 0,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
      dayStyle: TextStyle(color: AppColors.grey_500),
      surfaceTintColor: Colors.transparent,
      headerHelpStyle: TextStyle(
        color: AppColors.grey_600,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    disabledColor: AppColors.grey_200,
    inputDecorationTheme: InputDecorationTheme(
      isDense: false,
      prefixIconColor: AppColors.grey_600,
      labelStyle: const TextStyle(
        color: AppColors.grey_600,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      hintStyle: TextStyle(
        color: AppColors.grey_500.changeOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.grey_200,
          strokeAlign: 1.0,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: AppColors.primary, width: 2, strokeAlign: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.grey_200,
          strokeAlign: 1.0,
        ),
      ),
      //DISABLE  ------
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.grey_200,
          strokeAlign: 1.0,
        ),
      ),
      //ERROR  ------
      errorStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.red_400.changeOpacity(0.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(width: 1, color: AppColors.red_400, strokeAlign: 1.0),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(width: 2, color: AppColors.red_400, strokeAlign: 1.0),
      ),
    ),
  );
}
