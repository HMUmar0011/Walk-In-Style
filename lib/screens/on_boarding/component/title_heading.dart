// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';

class TitleHeading extends StatelessWidget {
   TitleHeading({super.key,required this.largeText,required this.largeText2,required this.smallText1,required this.smallText2});
  String largeText;
  String largeText2;
  String smallText1;
  String smallText2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: screenSize.width*0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(largeText,style: AppTextStyle.boldTextStyle(),),
          Text(largeText2,style: AppTextStyle.boldTextStyle(),),
          Text(smallText1,style: AppTextStyle.smallTextStyle(),),
          Text(smallText2,style: AppTextStyle.smallTextStyle(),)
        ],
      ),
    ) ;
  }
}