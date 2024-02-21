import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';
import 'package:walkinstyleapp/utilities/validation.dart';
import 'package:walkinstyleapp/widgets/custom_text_field.dart';

Widget buildPasswordField(BuildContext context, bool obscureText ,TextEditingController passwordController) {
    return StatefulBuilder(
      builder: (context, setState) {
        return CustomTextFormField(
          obscureText: obscureText,
          controller: passwordController,
          suffix: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill,
            ),
          ),
          hintText: "Enter Your Password",
          validator: (value) => isValidPassword(value),
          fillColor: AppColors.white,
        );
      },
    );
  }