import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/authentication/components/password_text_field_controller.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/bloc/sign_in_screen_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/bloc/sign_in_screen_bloc_event.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/bloc/sign_in_screen_bloc_state.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/utilities/validation.dart';
import 'package:walkinstyleapp/widgets/custom_app_bar.dart';
import 'package:walkinstyleapp/widgets/custom_btn.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundAppColor,
        body: SafeArea(
          child: SingleChildScrollView(
              child: ColoredBox(
                  color: Colors.transparent,
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.04,
                      ),
                      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                        builder: (context, state) {
                          state as LoginButtonState;

                          return Form(
                            key: state.formKey,
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
                                  "Hello Again!",
                                  style: AppTextStyle.boldTextStyle(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const CustomSizedBox(heightRatio: 0.003),
                                Center(
                                  child: FittedBox(
                                    child: Text(
                                      "welcome back to you've been missed!",
                                      style: AppTextStyle.smallTextStyle(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: mediumHeightRatio),

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
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                // Email Address Input Field
                                CustomTextFormField(
                                  controller: state.emailController,
                                  hintText: 'allisionbacker002@gmail.com',
                                  fillColor: AppColors.white,
                                  validator: (value) => isValidEmail(value),
                                ),
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
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                buildPasswordField(context, obscureText, state.passwordController),

                                // some space
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                //! recovery password
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.forgotPassword);
                                    },
                                    child: Text(
                                      'Recovery Password',
                                      style: AppTextStyle.smallTextStyle(),
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: mediumHeightRatio),

                                // !SignUp Button Sections
                                CustomButton(
                                    height: customBtnHeight,
                                    onPressed: () {
                                      BlocProvider.of<LoginScreenBloc>(context, listen: false).add(LoginButtonEvent(context: context));
                                    },
                                    buttonText: "Sign In"),
                                // some space
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                // ! Google Button Sections .
                                CustomButton(
                                  height: customBtnHeight,
                                  background: AppColors.white,
                                  textColor: AppColors.largeTextColor,
                                  onPressed: () {
                                    BlocProvider.of<LoginScreenBloc>(context, listen: false).add(GoogleSignInEvent(context: context));
                                  },
                                  buttonText: "Sign In With Google",
                                ),
                                const CustomSizedBox(heightRatio: extraLargeHeightRatio),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:screenSize.width*0.1),
                                  child: FittedBox(
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                      Text("Don't have an Account?", style: AppTextStyle.smallTextStyle()),
                                      Padding(
                                          padding: const EdgeInsets.only(left: 2),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(context, Routes.signUp);
                                            },
                                            child: Text(
                                              "Sign Up for free",
                                              style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                                            ),
                                          ))
                                    ]),
                                  ),
                                ),
                              const CustomSizedBox(heightRatio: mediumHeightRatio,)
                              ],
                            ),
                          );
                        },
                      )))),
        ));
  }
}
