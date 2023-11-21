import 'package:flutter/material.dart';

/*class AppLightColors extends AppColors {

}*/

class AppDarkColors extends AppColors {
  AppDarkColors()
      : super(
          backgroundPrimary: const Color(0xFF292929),
          backgroundSecondary: const Color(0xFF373737),
          borderPrimary: const Color(0xFFE3E3E3),
          borderSecondary: const Color(0xFF444444),
          textPrimary: const Color(0xFFE3E3E3),
          textSecondary: const Color(0xFF838383),
          button: const Color(0xFF2D3657),
          error: const Color(0xFFBD1F1F),
        );
}

class AppColors extends ThemeExtension<AppColors> {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color borderPrimary;
  final Color borderSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color button;
  final Color error;

  const AppColors({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.button,
    required this.error,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? borderPrimary,
    Color? borderSecondary,
    Color? textPrimary,
    Color? textSecondary,
    Color? button,
    Color? error,
  }) {
    return AppColors(
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      button: button ?? this.button,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other == null || other.runtimeType != AppColors) {
      return this;
    }

    final AppColors typedOther = other as AppColors;

    return AppColors(
      backgroundPrimary:
          Color.lerp(backgroundPrimary, typedOther.backgroundPrimary, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, typedOther.backgroundSecondary, t)!,
      borderPrimary: Color.lerp(borderPrimary, typedOther.borderPrimary, t)!,
      borderSecondary:
          Color.lerp(borderSecondary, typedOther.borderSecondary, t)!,
      textPrimary: Color.lerp(textPrimary, typedOther.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, typedOther.textSecondary, t)!,
      button: Color.lerp(button, typedOther.button, t)!,
      error: Color.lerp(error, typedOther.error, t)!,
    );
  }
}
