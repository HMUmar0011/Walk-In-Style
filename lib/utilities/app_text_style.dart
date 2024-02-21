import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/constants.dart';

abstract class AppTextStyle {
  //! OnBoarding Screen 
  //** Text Style Nike Text
 static TextStyle nikeTextStyle(){
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenSize.height*0.2,
      overflow: TextOverflow.ellipsis,
      color: AppColors.titleTextColors
    );
  
  }
    // OnBoarding Bold Text1
 static TextStyle boldTextStyle(){
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: screenSize.height*0.05,
      letterSpacing: 1,
      color: AppColors.largeTextColor
    );
  
  }
      // OnBoarding Bold Text2
 
 static TextStyle smallTextStyle({Color? color,double? size}){
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize:size?? screenSize.height*0.025,
      letterSpacing: 1,
      color:color?? AppColors.titleTextColors 
    );
  
  }
 
   static TextStyle customButtonTextStyle({Color? btnTextcolor}) {
    return  TextStyle(
      fontSize: 18,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      color: btnTextcolor
    );
  }
  // drawer text style
  static TextStyle drawerTextStyle() {
    return GoogleFonts.alegreya(
      color: AppColors.white,
      fontSize: 18.0,
      height: 0.0,
      textStyle: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      fontWeight: FontWeight.w500,
    );
  }
}
