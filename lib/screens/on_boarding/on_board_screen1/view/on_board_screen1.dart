import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/widgets/custom_btn.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundAppColor,
      body: Column(
        children: [
          Expanded(child: Container(
            child: Stack(
              children: [
                Positioned(
                  left: 2,
                  right: 2,
                  child: ClipOval(child: Container(color:Colors.lightBlue,))),
                  Align(alignment: Alignment.center,child: Text('Nike',style: const TextStyle(color: Colors.grey),))
              ],
            ),
          )),
          Expanded(child: Container(
            child: Column(
              children: [
          Align(
            alignment: Alignment.centerLeft,child: Text('Start your journey \n With Nike',style: TextStyle(color: AppColors.largeTextColor,fontSize:30 ),)),
                 Align(
            alignment: Alignment.centerLeft,child: Text('Smart,Gorgeous & Fashionable \n Collection',style: TextStyle(color: AppColors.largeTextColor,fontSize:15 ),)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(),
                  CustomButton(onTap: () {
                    
                  }, btnName:'Get Started')
                ],)
              ],
            ),
          )),

        ],
      ),
    );
  }
}