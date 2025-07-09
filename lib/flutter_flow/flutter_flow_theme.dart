// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color buttonBlack;
  late Color pageViewDots;
  late Color tfBackground;
  late Color tfBackGround;
  late Color grayTextMiddle;
  late Color textFieldBorderColor;
  late Color arrowColor;
  late Color textfieldColor;
  late Color searchTextfieldColor;
  late Color redColor;
  late Color toggleColor;
  late Color richBlackFOGRA39;
  late Color blue;
  late Color turquoise;
  late Color cultured;
  late Color cerise;
  late Color movingGreen;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF28BED0);
  late Color secondary = const Color(0xFF000000);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFEFF4F8);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFF1F3F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFFE0E3E7);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFF7F1B22);
  late Color info = const Color(0xFFFFFFFF);

  late Color buttonBlack = const Color(0xFF101010);
  late Color pageViewDots = const Color(0xFFE0E0E0);
  late Color tfBackground = const Color(0xFFFAFAFA);
  late Color tfBackGround = const Color(0xFFF5F5F5);
  late Color grayTextMiddle = const Color(0xFF8C959C);
  late Color textFieldBorderColor = const Color(0x849F9F9F);
  late Color arrowColor = const Color(0xFF393B4A);
  late Color textfieldColor = const Color(0xFF808184);
  late Color searchTextfieldColor = const Color(0xFFF8F9FC);
  late Color redColor = const Color(0xFFFF000D);
  late Color toggleColor = const Color(0xFFE9E9E9);
  late Color richBlackFOGRA39 = const Color(0xFF070707);
  late Color blue = const Color(0xFF3A28DE);
  late Color turquoise = const Color(0xFF34D1BF);
  late Color cultured = const Color(0xFFEFEFEF);
  late Color cerise = const Color(0xFFD1345B);
  late Color movingGreen = const Color(0xFF00B23D);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'arial';
  bool get displayLargeIsCustom => true;
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'arial';
  bool get displayMediumIsCustom => true;
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'arial';
  bool get displaySmallIsCustom => true;
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'arial';
  bool get headlineLargeIsCustom => true;
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'arial';
  bool get headlineMediumIsCustom => true;
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'arial';
  bool get headlineSmallIsCustom => true;
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'arial';
  bool get titleLargeIsCustom => true;
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'arial';
  bool get titleMediumIsCustom => true;
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'arial',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'arial';
  bool get titleSmallIsCustom => true;
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'arial',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'arial';
  bool get labelLargeIsCustom => true;
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'arial',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'arial';
  bool get labelMediumIsCustom => true;
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'arial',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'arial';
  bool get labelSmallIsCustom => true;
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'arial',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'arial';
  bool get bodyLargeIsCustom => true;
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'arial',
        color: theme.textfieldColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'arial';
  bool get bodyMediumIsCustom => true;
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'arial';
  bool get bodySmallIsCustom => true;
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'arial',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF28BED0);
  late Color secondary = const Color(0xFFFFFFFF);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF1D2428);
  late Color secondaryBackground = const Color(0xFF14181B);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xB2262D34);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color buttonBlack = const Color(0xFF7CFFEF);
  late Color pageViewDots = const Color(0xFF323C40);
  late Color tfBackground = const Color(0xB2262D34);
  late Color tfBackGround = const Color(0xB236404A);
  late Color grayTextMiddle = const Color(0xFF8C959C);
  late Color textFieldBorderColor = const Color(0xFF81AB1E);
  late Color arrowColor = const Color(0xFFD6DC82);
  late Color textfieldColor = const Color(0xFF808184);
  late Color searchTextfieldColor = const Color(0xFFAFF9F5);
  late Color redColor = const Color(0xFFFF000D);
  late Color toggleColor = const Color(0xFF5C51D8);
  late Color richBlackFOGRA39 = const Color(0xFF070707);
  late Color blue = const Color(0xFF3A28DE);
  late Color turquoise = const Color(0xFF34D1BF);
  late Color cultured = const Color(0xFFEFEFEF);
  late Color cerise = const Color(0xFFD1345B);
  late Color movingGreen = const Color(0xFFAFA26D);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
