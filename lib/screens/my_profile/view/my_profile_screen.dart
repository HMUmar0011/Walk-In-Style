import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/authentication/components/password_text_field_controller.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/app_text_style.dart';
import 'package:walkinstyleapp/utilities/constants.dart';
import 'package:walkinstyleapp/utilities/validation.dart';
import 'package:walkinstyleapp/widgets/custom_app_bar.dart';
import 'package:walkinstyleapp/widgets/custom_sized_box.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: ColoredBox(
                color: Colors.transparent,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.04,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          const CustomSizedBox(
                            heightRatio: mediumHeightRatio,
                          ),
                          CustomAppBar(
                            leadingCallbackAction: () {},
                            centerWidget: const Text('Profile'),
                            trailingIcon: const Icon(
                              Icons.pending_actions_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          // Some Space
                          const CustomSizedBox(
                            heightRatio: mediumHeightRatio,
                          ),
                          Text(
                            "Allison Becker",
                            style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const CustomSizedBox(heightRatio: 0.002),
                         
                         
                          // ! User Name sections
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Full Name",
                              style: AppTextStyle.smallTextStyle(color: AppColors.largeTextColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const CustomSizedBox(heightRatio: smallHeightRatio),
                          //! name text field
                          CustomTextFormField(
                            controller: TextEditingController(),
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
                            controller: TextEditingController(),
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
                          const CustomSizedBox(heightRatio: smallHeightRatio),
                          buildPasswordField(context, true, TextEditingController()),

                          const CustomSizedBox(heightRatio: mediumHeightRatio),

                          // some space
                          const CustomSizedBox(heightRatio: mediumHeightRatio),
                        ],
                      ),
                    )))),
      ),
    );
  }
}
