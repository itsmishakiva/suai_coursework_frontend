import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/themes/app_colors.dart';
import 'package:suai_coursework_frontend/themes/app_text_styles.dart';

extension ThemeExtensions on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
}
