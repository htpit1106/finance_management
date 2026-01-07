import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String? textButton;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double minWidth;
  final double minHeight;

  const AppTextButton({
    super.key,
    this.textButton,
    this.onTap,
    this.backgroundColor = AppColors.greenBtn,

    this.minWidth = 0,
    this.minHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(minWidth, minHeight),
      ),
      child: Text(textButton ?? "Button", style: AppTextStyle.greenDarkSemiBoldS20),
    );
  }
}
