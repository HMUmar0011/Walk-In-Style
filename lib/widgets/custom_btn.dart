import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width,
      this.height,
      required this.onPressed,
      required this.buttonText,
      this.background,
      this.textColor});
  final VoidCallback onPressed;
  final String buttonText;
  final double? width;
  final double? height;
  final Color? background;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: background ?? AppColors.btnColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(54)),
      textColor:AppColors.white,
      elevation: 0,
      splashColor: Colors.transparent,
      minWidth: width,
      height: height,
      focusElevation: 8,
      child: Center(
        child: Text(buttonText,
            style: AppTextStyle
                .customButtonTextStyle(btnTextcolor: textColor)),
      ),
    );
  }
}