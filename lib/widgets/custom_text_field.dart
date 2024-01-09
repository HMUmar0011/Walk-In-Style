import 'package:flutter/material.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.textInputAction,
    this.filled,
    this.fillColor=Colors.white,
    this.hintStyle,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool enabled;
  final ValueChanged? onChanged;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      enabled: enabled,
      onChanged: onChanged,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        
        border: _border,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: _border,
        focusedBorder: _focusBorder,
        filled: filled,
        fillColor: fillColor,
        
      ),
    );
  }

  get _focusBorder => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: AppColors.white,));
       get _border => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: AppColors.white));
}
