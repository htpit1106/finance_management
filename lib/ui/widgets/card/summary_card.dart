import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color backgroundColor;
  final Color iconColor;
  final Color textAmountColor;
  final Color textTitleColor;
  final String iconPath;

  const SummaryCard({
    super.key,
    this.title = "Income",
    this.amount = 4120.0,
    this.backgroundColor = AppColors.lightBackground,
    this.iconColor = AppColors.greenBtn,
    this.textAmountColor = AppColors.greenDarkText,
    this.textTitleColor = AppColors.greenDarkText,
    this.iconPath = AppIcons.icArrowUp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, color: iconColor, width: 25, height: 25),
          Text(title, style: AppTextStyle.greenDarkS15.copyWith(color: textTitleColor)),
          Text("\$$amount", style: AppTextStyle.greenDarkBoldS20.copyWith(color: textAmountColor)),
        ],
      ),
    );
  }
}
