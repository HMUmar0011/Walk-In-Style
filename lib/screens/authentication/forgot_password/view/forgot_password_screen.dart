import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/authentication/forgot_password/bloc/forgot_password_screen_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/forgot_password/bloc/forgot_password_screen_state.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/utilities/validation.dart';
import 'package:walkinstyleapp/widgets/custom_app_bar.dart';
import 'package:walkinstyleapp/widgets/custom_btn.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                          horizontal: screenSize.width * 0.05,
                        ),
                        child: BlocBuilder<ForgotPasswordScreenCubit, ForgotPasswordScreenState>(
                          builder: (context, state) {
                            state as ForgotPasswordButtonState;
                            return Form(
                              key: state.formKey,
                              child: Column(children: [
                                  const CustomSizedBox(
                                  heightRatio: mediumHeightRatio,
                                ),
                                CustomAppBar(leadingCallbackAction: () {
                                  Navigator.pop(context,Routes.login
                                  );
                                }),
                                // Some Space
                                const CustomSizedBox(
                                  heightRatio: mediumHeightRatio,
                                ),
                                Padding(
                                   padding:  EdgeInsets.symmetric(horizontal:screenSize.width*0.08),
                                  child: FittedBox(
                                    child: Text(
                                      "Recovery Password",
                                      style: AppTextStyle.boldTextStyle(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                Padding(
                                   padding:  EdgeInsets.symmetric(horizontal:screenSize.width*0.08),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        "Please Enter Your Email Address To\n  Receive a Verification Code",
                                        style: AppTextStyle.smallTextStyle(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                                const CustomSizedBox(heightRatio: 0.05),
                                // ! User Name sections
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
                                //! name text field
                                CustomTextFormField(
                                  controller: state.emailController,
                                  hintText: 'Allison Backer',
                                  validator: (value) => isValidEmail(value),
                                  fillColor: AppColors.white,
                                ),

                                // some space
                                const CustomSizedBox(heightRatio: largeHeightRatio),

                                // !SignUp Button Sections
                                CustomButton(height: screenSize.height * 0.08, onPressed: () {
                                  BlocProvider.of<ForgotPasswordScreenCubit>(context,listen: false).recoveredPassword(context);
                                }, buttonText: "Continue"),
                                // some space
                                const CustomSizedBox(heightRatio: mediumHeightRatio),
                              ]),
                            );
                          },
                        ))))));
  }
}
