import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/constants/colors/app_colors.dart';
import '../../core/utils/constants/colors/material_color.dart';
import 'app_theme_components.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.appBlack,
    primarySwatch: buildMaterialColor(AppColors.appBlack),
    brightness: Brightness.light,
    fontFamily: GoogleFonts.roboto().fontFamily,
    textTheme: GoogleFonts.robotoTextTheme(),
    elevatedButtonTheme: ButtonsTheme.elevatedButtonThemeData,
    textButtonTheme: ButtonsTheme.textButtonThemeData,
    inputDecorationTheme: InputDecorationsTheme.inputDecorationTheme,
    checkboxTheme: CustomCheckboxTheme.checkboxThemeData,
    dialogTheme: CustomDialogTheme.dialogThemeData,
    bottomSheetTheme: CustomBottomSheetTheme.dialogThemeData,
  );
}
