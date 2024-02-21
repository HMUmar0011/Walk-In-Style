import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/authentication/components/password_text_field_controller.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/bloc/sign_up_screen_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/bloc/sign_up_screen_bloc_event.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/bloc/sign_up_screen_bloc_state.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/utilities/validation.dart';
import 'package:walkinstyleapp/widgets/custom_app_bar.dart';
import 'package:walkinstyleapp/widgets/custom_btn.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
bool obscureText =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundAppColor,
        body: BlocBuilder<SignUpBloc, SignUpScreenBlocState>(
          builder: (context, state ) {
            var pageState=state as SignUpButtonState;
            return SafeArea(
              child: SingleChildScrollView(
                  child: ColoredBox(
                      color: Colors.transparent,
                      child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.04,
                          ),
                          child: Form(
                            key: (state).formKey,
                            child: Column(
                              children: [
                                const CustomSizedBox(
                                  heightRatio: mediumHeightRatio,
                                ),
                                CustomAppBar(leadingCallbackAction: () {

                                }),
                                // Some Space
                                const CustomSizedBox(
                                  heightRatio: mediumHeightRatio,
                                ),
                                Text(
                                  "Create Account",
                                  style: AppTextStyle.boldTextStyle(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const CustomSizedBox(heightRatio: 0.002),
                                Center(
                                  child: FittedBox(
                                    child: Text(
                                      "Let's Create Account Together",
                                      style: AppTextStyle.smallTextStyle(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                // ! User Name sections
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Your Name",
                                    style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: smallHeightRatio),
                                //! name text field
                                CustomTextFormField(
                                  controller: pageState.nameController,
                                  hintText: 'Allison Backer',
                                  fillColor: AppColors.white,
                                  validator: (value) => isValidUsername(value),
                                ),
                                // some space
                                const CustomSizedBox(heightRatio: smallHeightRatio),
                                // ! Email sections
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Email Address",
                                    style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: smallHeightRatio),
                                // Email Address Input Field
                                CustomTextFormField(
                                    controller: pageState.emailController,
                                     hintText: 'allisionbacker002@gmail.com',
                                      fillColor: AppColors.white,
                                      validator: (value) => isValidEmail(value),),
                                // some space
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                // ! Password sections
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Password",
                                    style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: smallHeightRatio),
                                buildPasswordField(context,obscureText,pageState.passwordController),
                                
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                          
                                // !SignUp Button Sections
                                CustomButton(height: customBtnHeight, onPressed: () {
                                    BlocProvider.of<SignUpBloc>(context,listen: false).add(SignUpButtonEvent(context));
                          
                                }, buttonText: "Sign Up"),
                                // some space
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                // ! Google Button Sections .
                                CustomButton(
                                  height: customBtnHeight,
                                  background: AppColors.white,
                                  textColor: AppColors.largeTextColor,
                                  onPressed: () {
                                    BlocProvider.of<SignUpBloc>(context,listen: false).add(GoogleSignInEvent(context: context));
                                  },
                                  buttonText: "Sign In With Google",
                                ),
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                Padding(
                                   padding:  EdgeInsets.symmetric(horizontal:screenSize.width*0.1),
                                  child: FittedBox(
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                      Text("Already have an account?", style: AppTextStyle.smallTextStyle()),
                                      Padding(
                                          padding: const EdgeInsets.only(left: 2),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(context, Routes.login);
                                            },
                                            child: Text(
                                              "Sign In",
                                              style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                                            ),
                                          ))
                                    ]),
                                  ),
                                ),
                                const CustomSizedBox()
                              ],
                            ),
                          )))),
            );
          },
        ));
  }
}
