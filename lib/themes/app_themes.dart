import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/themes/app_colors.dart';
import 'package:suai_coursework_frontend/themes/app_text_styles.dart';

class AppThemes {
  final _appDarkColors = AppDarkColors();

  ThemeData darkThemeData() {
    return ThemeData(
      splashColor: Colors.transparent,
      focusColor: Colors.black.withOpacity(0.1),
      hoverColor: Colors.black.withOpacity(0.1),
      highlightColor: Colors.black.withOpacity(0.1),
      extensions: [
        _appDarkColors,
        AppDarkTextStyles(colors: _appDarkColors),
      ],
    );
  }
}
