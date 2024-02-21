import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/on_boarding/component/title_heading.dart';
import 'package:walkinstyleapp/screens/on_boarding/view/on_board_screen.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
// ignore: must_be_immutable
class CustomPage extends StatefulWidget {
   CustomPage({super.key,
  required this. imagePath,
  required this. largeText,
  required this. largeText2,
  required this.smallText1,
  required this. smallText2,});
  String imagePath;
  String largeText;
 String largeText2;
 String smallText2;
 String smallText1;

  
  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
   
   
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: screenSize.width,
        height: screenSize.height,
        color: AppColors.backgroundAppColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Big Text OnBoarding Screen
          Expanded(flex: 6,
           child: 
           textAndNikeBoots(widget.imagePath)
           ),
          // ! Sneaker App Description in OnBoarding Screens .
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TitleHeading(
                largeText: widget.largeText,
                largeText2: widget.largeText2,
                smallText1: widget.smallText1,
                smallText2: widget.smallText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

