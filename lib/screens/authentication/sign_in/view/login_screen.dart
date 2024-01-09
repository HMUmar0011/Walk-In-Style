import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/widgets/custom_btn.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
    backgroundColor: AppColors.backgroundAppColor,
      body: Column(
        children: [
          Center(child: Text('Hello Again!',style: TextStyle(color: AppColors.largeTextColor,fontSize:30 ),)),
          Center(child: Text('Welcome Back You Have Been Missed',style: TextStyle(color: AppColors.largeTextColor,fontSize:20 ),)),
          Align(alignment: Alignment.centerLeft,child: Text('Email',style: TextStyle(color: AppColors.largeTextColor,fontSize:20 ),)),
         
          Expanded(
            flex: 1,
            child: CustomTextField(
            hintText: 'e-mail',
            controller: TextEditingController(),
            ),
          ),
          Expanded(child: Align(alignment: Alignment.centerLeft,child: Text('Password',style: TextStyle(color: AppColors.largeTextColor,fontSize:20 ),))),

           Expanded(
            flex: 1,
             child: CustomTextField(
                       hintText: 'password',
                       controller: TextEditingController(),
                       ),
           ),
          Expanded(child: Align(alignment: Alignment.centerRight,child: Text('Recovery Password',style: TextStyle(color: AppColors.largeTextColor,fontSize:20 ),))),

          Expanded(
            flex: 1,
            child: CustomButton(onTap: () {
              
            }, btnName: 'Sign In'),
          ),
           Expanded(
            flex: 1,
            child: CustomButton(onTap: () {
              
            }, btnName: 'Sign in with google',
            textStyle: TextStyle(color: Colors.black),
            btnColor: AppColors.white,),
            
          ),
          const Spacer(),
          Expanded(child: Align(alignment: Alignment.center,child: Text('Dont have an Account SignUp for free',style: TextStyle(color: AppColors.largeTextColor,fontSize:20 ),))),
          
        ],
      ),
    );
  }
}