import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/constants.dart';

Widget customAppBar(Icon backBtnIcon,){

  return AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(

            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1,style: BorderStyle.solid),
              color:AppColors.white,
            ),
            child: const Icon(Icons.arrow_back_ios,color: AppColors.iconColor,),),
            
          ),
        ),
        centerTitle: true,
        title: Text('My Cart',style: TextStyle(color: AppColors.largeTextColor),),
        actions: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
          
            child: Container(
             width: screenSize.width*0.1 ,
             height: screenSize.height*0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1,style: BorderStyle.solid),
              color:AppColors.white,
            ),
            child: const Icon(Icons.shopping_bag,color: AppColors.iconColor,),),
            
          ),
                ),
        ],
      );
}