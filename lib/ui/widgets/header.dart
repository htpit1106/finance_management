import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/home/widget/icon_text.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final double percent;

  const AppHeader({super.key, this.percent = 0.7});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconText(
              text: "Total Balance",
              fontSize: 11,
              icPath: AppIcons.icArrowUp,
            ),
            IconText(
              text: "Total Expense",
              fontSize: 11,
              icPath: AppIcons.icArrowDown,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("\$7,783.00", style: AppTextStyle.greenDarkS13),
            Text("-\$1,187.40", style: AppTextStyle.oceanBlueS20Bold),
            Text("-\$1,187.40", style: AppTextStyle.oceanBlueS20Medium),
          ],
        ),

        // process
        _buildProcessBar(percent),

        IconText(
          text: "30% of your expenses, looks good.",
          icPath: AppIcons.icTick,
          fontSize: 15,
        ),
      ],
    );
  }

  Widget _buildProcessBar(double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Stack(
        children: [
          Container(
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.blackText,
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "${(100 - percent * 100).toInt()}%",
              style: AppTextStyle.whiteS12Light,
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: percent,
              child: Container(
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "\$20,000.00",
                  style: AppTextStyle.greenDarkMediumS14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
