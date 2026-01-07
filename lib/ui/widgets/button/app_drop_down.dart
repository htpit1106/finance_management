import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AppDropDown({super.key, this.text = "Select", this.onTap});

  @override
  Widget build(BuildContext context) {

      return Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(text, style: AppTextStyle.greenS15Medium),
              Icon(Icons.keyboard_arrow_down, color: Color(0xFF00C491)),
            ],
          ),
        ),
      );

  }
}
