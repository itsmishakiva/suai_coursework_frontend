import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/themes/app_colors.dart';

/*class AppLightColors extends AppColors {

}*/

class AppDarkTextStyles extends AppTextStyles {
  AppDarkTextStyles({
    required AppColors colors,
  }) : super(
          header1: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
            color: colors.textPrimary,
          ),
          header2: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            color: colors.textPrimary,
          ),
          header3: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            color: colors.textPrimary,
          ),
          header4: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: colors.textPrimary,
          ),
          bodyText1: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w300,
            fontSize: 14.0,
            color: colors.textPrimary,
          ),
          subtitle1: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: colors.textPrimary,
          ),
          subtitle2: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
            color: colors.textPrimary,
          ),
          subtitle3: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w500,
            fontSize: 10.0,
            color: colors.textPrimary,
          ),
          helper1: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: colors.textSecondary,
          ),
          textField1: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: colors.textPrimary,
          ),
          textFieldLabel1: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: colors.textSecondary,
          ),
          textFieldLabel2: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
            color: colors.textSecondary,
          ),
          textFieldLabel3: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
            color: colors.textSecondary,
          ),
          onButton: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: colors.textPrimary,
          ),
          onTextButton: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: colors.textPrimary,
          ),
          error: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: colors.error,
          ),
    subtitle4: TextStyle(
      fontFamily: "Nunito",
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      color: colors.textSecondary,
    ),
        );
}

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle header4;
  final TextStyle bodyText1;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle subtitle3;
  final TextStyle subtitle4;
  final TextStyle helper1;
  final TextStyle textField1;
  final TextStyle textFieldLabel1;
  final TextStyle textFieldLabel2;
  final TextStyle textFieldLabel3;
  final TextStyle onButton;
  final TextStyle onTextButton;
  final TextStyle error;

  const AppTextStyles({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.bodyText1,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.helper1,
    required this.textField1,
    required this.textFieldLabel1,
    required this.textFieldLabel2,
    required this.textFieldLabel3,
    required this.onButton,
    required this.onTextButton,
    required this.error,
  });

  @override
  ThemeExtension<AppTextStyles> copyWith({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? header4,
    TextStyle? bodyText1,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle3,
    TextStyle? subtitle4,
    TextStyle? helper1,
    TextStyle? textField1,
    TextStyle? textFieldLabel1,
    TextStyle? textFieldLabel2,
    TextStyle? textFieldLabel3,
    TextStyle? onTextButton,
    TextStyle? onButton,
    TextStyle? error,
  }) {
    return AppTextStyles(
      header1: header1 ?? this.header1,
      header2: header2 ?? this.header2,
      header3: header3 ?? this.header3,
      header4: header4 ?? this.header4,
      bodyText1: bodyText1 ?? this.bodyText1,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      subtitle3: subtitle3 ?? this.subtitle3,
      subtitle4: subtitle4 ?? this.subtitle4,
      helper1: helper1 ?? this.helper1,
      textField1: textField1 ?? this.textField1,
      textFieldLabel1: textFieldLabel1 ?? this.textFieldLabel1,
      textFieldLabel2: textFieldLabel2 ?? this.textFieldLabel2,
      textFieldLabel3: textFieldLabel3 ?? this.textFieldLabel3,
      onButton: onTextButton ?? this.onButton,
      onTextButton: onButton ?? this.onTextButton,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
      covariant ThemeExtension<AppTextStyles>? other, double t) {
    if (other == null || other.runtimeType != AppTextStyles) {
      return this;
    }

    final AppTextStyles typedOther = other as AppTextStyles;

    return AppTextStyles(
      header1: TextStyle.lerp(header1, typedOther.header1, t)!,
      header2: TextStyle.lerp(header2, typedOther.header2, t)!,
      header3: TextStyle.lerp(header3, typedOther.header3, t)!,
      header4: TextStyle.lerp(header4, typedOther.header4, t)!,
      bodyText1: TextStyle.lerp(bodyText1, typedOther.bodyText1, t)!,
      subtitle1: TextStyle.lerp(subtitle1, typedOther.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, typedOther.subtitle2, t)!,
      subtitle3: TextStyle.lerp(subtitle3, typedOther.subtitle3, t)!,
        subtitle4: TextStyle.lerp(subtitle4, typedOther.subtitle4, t)!,
      helper1: TextStyle.lerp(helper1, typedOther.helper1, t)!,
      textField1: TextStyle.lerp(textField1, typedOther.textField1, t)!,
      textFieldLabel1:
          TextStyle.lerp(textFieldLabel1, typedOther.textFieldLabel1, t)!,
      textFieldLabel2:
          TextStyle.lerp(textFieldLabel2, typedOther.textFieldLabel2, t)!,
      textFieldLabel3:
          TextStyle.lerp(textFieldLabel3, typedOther.textFieldLabel3, t)!,
      onButton: TextStyle.lerp(onButton, typedOther.onButton, t)!,
      onTextButton: TextStyle.lerp(onTextButton, typedOther.onTextButton, t)!,
      error: TextStyle.lerp(error, typedOther.error, t)!,
    );
  }
}
