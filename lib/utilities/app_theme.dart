import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';

 abstract class CustomThemeData  {
  static ThemeData myCustomTheme(){
    return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundAppColor,
    textTheme:_getTextTheme(),
    colorScheme: _getColorScheme()

    );
  }
  static TextTheme _getTextTheme(){
    return TextTheme(
   displayLarge: GoogleFonts.poppins(
    color: AppColors.largeTextColor,
    fontSize: 40.0,
    fontWeight: FontWeight.w500

   ),
   headlineSmall: GoogleFonts.poppins(
    color: AppColors.titleTextColors,
    fontSize: 18,
    height: 0.0,
    fontWeight: FontWeight.w600
   )
    );
  }
  static ColorScheme _getColorScheme(){
    return ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.white,
      onPrimary: AppColors.white,
      onError: AppColors.errorColor,
      background: AppColors.backgroundAppColor
    );
  }

}