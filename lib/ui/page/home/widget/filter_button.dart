import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final bool isActive;
  final String text;
  final VoidCallback? onTap;
  const FilterButton({super.key, this.isActive = false, this.text = "Daily", this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.greenBtn : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: AppTextStyle.greenDarkS15, textAlign: TextAlign.center),
      ),
    );
  }
}
