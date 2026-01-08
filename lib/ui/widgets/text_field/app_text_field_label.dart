import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextFieldLabel extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconTap;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int maxLines;
  final TextStyle? hintTextStyle;


  const AppTextFieldLabel({
    super.key,
    this.hintText = "",
    this.labelText = "",
    this.obscureText = false,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconTap,
    this.maxLines = 1,
    this.hintTextStyle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(labelText, style: AppTextStyle.greenDarkS15),
        const SizedBox(height: 10),
        TextFormField(

          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(minWidth: 15, minHeight: 15),
            hintStyle: hintTextStyle ?? AppTextStyle.hintText,
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.redBorder, width: 1.0),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.redBorder, width: 1.5),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: AppColors.greenBtn, width: 1.5),
            )


          ),
        ),
      ],
    );
  }
}
