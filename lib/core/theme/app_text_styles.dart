import 'package:calories_fix/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _getBaseStyle(
    String lang,
    double size,
    FontWeight? weight,
    Color? color,
  ) {
    return lang == 'ar'
        ? GoogleFonts.cairo(
            fontSize: size,
            fontWeight: weight ?? FontWeight.normal,
            color: color,
          )
        : GoogleFonts.montserrat(
            fontSize: size,
            fontWeight: weight ?? FontWeight.normal,
            color: color,
          );
  }

  static TextStyle regular12({Color? color, required String lang}) =>
      _getBaseStyle(lang, 12, null, color);

  static TextStyle regular14({Color? color, required String lang}) =>
      _getBaseStyle(lang, 14, null, color);

  static TextStyle regular16({Color? color, required String lang}) =>
      _getBaseStyle(lang, 16, null, color);


  static TextStyle medium14({Color? color, required String lang}) =>
      _getBaseStyle(lang, 14, FontWeight.w500, color);


  static TextStyle semiBold12({Color? color, required String lang}) =>
      _getBaseStyle(lang, 12, FontWeight.w600, color);

  static TextStyle semiBold14({Color? color, required String lang}) =>
      _getBaseStyle(lang, 14, FontWeight.w600, color);

  static TextStyle semiBold16({Color? color, required String lang}) =>
      _getBaseStyle(lang, 16, FontWeight.w600, color);

  static TextStyle semiBold20({Color? color, required String lang}) =>
      _getBaseStyle(lang, 20, FontWeight.w600, color);

  static TextStyle semiBold24({Color? color, required String lang}) =>
      _getBaseStyle(lang, 24, FontWeight.w600, color);


  static TextStyle bold16({Color? color, required String lang}) =>
      _getBaseStyle(lang, 16, FontWeight.w700, color);
    
  static TextStyle bold20({Color? color, required String lang}) =>
      _getBaseStyle(lang, 20, FontWeight.w700, color);

  static TextStyle black40({Color? color, required String lang}) =>
      _getBaseStyle(lang, 40, FontWeight.w900, color);
}

extension AppTextStylesExt on BuildContext {
  String get _currentLang =>
      Provider.of<LanguageProvider>(this).currentLanguage;

  TextStyle get regular12 => AppTextStyles.regular12(lang: _currentLang);
  TextStyle get regular14 => AppTextStyles.regular14(lang: _currentLang);
  TextStyle get regular16 => AppTextStyles.regular16(lang: _currentLang);
  TextStyle get medium14 => AppTextStyles.medium14(lang: _currentLang);
  TextStyle get semiBold12 => AppTextStyles.semiBold12(lang: _currentLang);
  TextStyle get semiBold14 => AppTextStyles.semiBold14(lang: _currentLang);
  TextStyle get semiBold16 => AppTextStyles.semiBold16(lang: _currentLang);
  TextStyle get semiBold20 => AppTextStyles.semiBold20(lang: _currentLang);
  TextStyle get semiBold24 => AppTextStyles.semiBold24(lang: _currentLang);
  TextStyle get bold16 => AppTextStyles.bold16(lang: _currentLang);
  TextStyle get bold20 => AppTextStyles.bold20(lang: _currentLang);
  TextStyle get black40 => AppTextStyles.black40(lang: _currentLang);
}


/// | NAME           | SIZE |  WEIGHT |  SPACING |             |
/// |----------------|------|---------|----------|-------------|
/// | displayLarge   | 96.0 | light   | -1.5     |             |
/// | displayMedium  | 60.0 | light   | -0.5     |             |
/// | displaySmall   | 48.0 | regular |  0.0     |             |
/// | headlineMedium | 34.0 | regular |  0.25    |             |
/// | headlineSmall  | 24.0 | regular |  0.0     |             |
/// | titleLarge     | 20.0 | medium  |  0.15    |             |
/// | titleMedium    | 16.0 | regular |  0.15    |             |
/// | titleSmall     | 14.0 | medium  |  0.1     |             |
/// | bodyLarge      | 16.0 | regular |  0.5     |             |
/// | bodyMedium     | 14.0 | regular |  0.25    |             |
/// | bodySmall      | 12.0 | regular |  0.4     |             |
/// | labelLarge     | 14.0 | medium  |  1.25    |             |
/// | labelSmall     | 10.0 | regular |  1.5     |             |
/// 
///  [w100]: Thin, the thinnest font weight.
///
///  [w200]: Extra light.
///
///  [w300]: Light.
///
///  [w400]: Normal. The constant [FontWeight.normal] is an alias for this value.
///
///  [w500]: Medium.
///
///  [w600]: Semi-bold.
///
///  [w700]: Bold. The constant [FontWeight.bold] is an alias for this value.
///
///  [w800]: Extra-bold.
///
///  [w900]: Black, the thickest font weight.