import 'package:flutter/material.dart';

import '../../core/utils/constants/colors/app_colors.dart';
import '../../core/utils/constants/styles/app_text_styles.dart';


class ButtonsTheme {
  ButtonsTheme._();

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextsTheme.textTheme.labelMedium!.copyWith(
        color: AppColors.appWhite,
      ),
      foregroundColor: AppColors.appWhite,
      backgroundColor: AppColors.appBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextsTheme.textTheme.labelMedium,
      padding: EdgeInsets.zero,
    ),
  );
}

class InputDecorationsTheme {
  InputDecorationsTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 26),
    filled: true,
    fillColor: AppColors.appGrey7f7f,
    hintStyle: TextsTheme.textTheme.labelSmall!.copyWith(
      color: AppColors.appGrey7070,
      fontSize: 14,
    ),
    errorStyle: TextsTheme.textTheme.labelSmall!.copyWith(
      color: AppColors.appRed0020,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.appGrey3e3e,
        width: 0.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.appGrey9e9e,
        width: 0.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.appRed0020,
        width: 1,
      ),
    ),
  );
}

class CustomCheckboxTheme {
  CustomCheckboxTheme._();

  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      return AppColors.appBlack;
    }),
    checkColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      return AppColors.appWhite;
    }),
    materialTapTargetSize: MaterialTapTargetSize.padded,
    visualDensity: VisualDensity.compact,
    side: BorderSide.none,
    splashRadius: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

class CustomDialogTheme {
  CustomDialogTheme._();

  static DialogTheme dialogThemeData = DialogTheme(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    backgroundColor: AppColors.appWhite,
    surfaceTintColor: AppColors.appTransparent,
    shadowColor: AppColors.appBlack10Opacity,
  );
}

class CustomBottomSheetTheme {
  CustomBottomSheetTheme._();

  static BottomSheetThemeData dialogThemeData = BottomSheetThemeData(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    backgroundColor: AppColors.appWhite,
    surfaceTintColor: AppColors.appTransparent,
    shadowColor: AppColors.appBlack10Opacity,
  );
}

class TextsTheme {
  TextsTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: AppTextStyles.textStyleBold20,
    headlineMedium: AppTextStyles.textStyleSemiBold20,
    headlineSmall: AppTextStyles.textStyleMedium20,
    titleLarge: AppTextStyles.textStyleBold16,
    titleMedium: AppTextStyles.textStyleSemiBold16,
    titleSmall: AppTextStyles.textStyleMedium16,
    bodyLarge: AppTextStyles.textStyleRegular20,
    bodyMedium: AppTextStyles.textStyleRegular16,
    labelLarge: AppTextStyles.textStyleBold16,
    labelMedium: AppTextStyles.textStyleMedium16,
    labelSmall: AppTextStyles.textStyleRegular16,
  );
}
