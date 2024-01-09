import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
       this.width,
      this.height,
      required this.onTap,
      required this.btnName,
     
      this.btnBoxBorder,
      this.btnColor = AppColors.btnColor,
      this.textStyle = const TextStyle(color:AppColors.white)});
  final Function() onTap;
  final String btnName;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? btnColor;
  final BoxBorder? btnBoxBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: btnColor,
         border: btnBoxBorder, borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
              btnName,
              style: textStyle,
            )),
      ),
    );
  }
}
