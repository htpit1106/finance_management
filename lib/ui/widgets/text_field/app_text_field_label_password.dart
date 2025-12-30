import 'package:finance_management/common/app_icons.dart';
import 'package:flutter/material.dart';

import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ObscureTextController extends ValueNotifier<bool> {
  ObscureTextController({bool obscureText = true}) : super(obscureText);

  void toggle() {
    value = !value;
  }
}

class AppTextFieldLabelPassword extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final TextInputType keyboardType;
  final ObscureTextController obscureTextController;

  const AppTextFieldLabelPassword({
    super.key,
    this.hintText = "● ● ● ● ● ● ●",
    this.labelText = "",
    this.obscureText = false,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    required this.obscureTextController,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextController,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText, style: AppTextStyle.greenDarkS15),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: value,
              validator: validator,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: InkWell(
                  onTap: () {
                    obscureTextController.toggle();
                  },
                  child:  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(value ? AppIcons.icEyeClose : AppIcons.icEyeOpen, width: 15, height: 10,
                    ),
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(minWidth: 15, minHeight: 15),
                hintStyle: AppTextStyle.hintText,
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
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColors.greenBtn, width: 1.5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
