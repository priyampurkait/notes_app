import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
// #### light colors #### //
  static Color _iconColorLight = Colors.red;
  static Color _scaffoldBackgroundColorLight = Colors.grey[100];
  static Color _primaryColorLight = _onPrimaryColorLight;
  static Color _accentColorLight = Colors.green;
  static Color _secondaryColorLight = Colors.orange;
  static Color _onPrimaryColorLight = Colors.white;
  static Color _onSecondaryColorLight = Colors.grey[200];

// #### dark colors #### //
  static Color _iconColorDark = Colors.red[200];
  static Color _scaffoldBackgroundColorDark = _onPrimaryColorDark;
// static Color _primaryColorDark = Colors.black87;
  static Color _accentColorDark = Colors.green[300];
  static Color _secondaryColorDark = Colors.orange[300];
  static Color _onPrimaryColorDark = Colors.black87;
  static Color _onSecondaryColorDark = Colors.grey[700];

// #### light theme #### //
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _scaffoldBackgroundColorLight,
    primaryColor: _primaryColorLight,
    // accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _onPrimaryColorLight,
      backgroundColor: _accentColorLight,
    ),
    colorScheme: ColorScheme.light(
      background: _onPrimaryColorLight,
      primary: _accentColorLight,
      secondary: _secondaryColorLight,
      secondaryVariant: _onSecondaryColorLight,
    ),
    iconTheme: IconThemeData(
      color: _iconColorLight,
    ),
  );

// #### dark theme #### //
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _scaffoldBackgroundColorDark,
    // accentColor: Colors.black87,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: _onPrimaryColorDark,
      backgroundColor: _accentColorDark,
    ),
    colorScheme: ColorScheme.dark(
      // background: Colors.black87,
      primary: _accentColorDark,
      secondary: _secondaryColorDark,
      secondaryVariant: _onSecondaryColorDark,
    ),
    iconTheme: IconThemeData(
      color: _iconColorDark,
    ),
  );
}
