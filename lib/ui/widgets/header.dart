import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/home/widget/icon_text.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final double balanceAmount;
  final double expenseAmount;

  const AppHeader({super.key, this.balanceAmount = 7783, this.expenseAmount = 1187.4});

  @override
  Widget build(BuildContext context) {
    final percent = 1 - safePercent(expenseAmount, balanceAmount) - 0.1;
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconText(text: "Total Balance", fontSize: 11, icPath: AppIcons.icArrowUp),
            IconText(text: "Total Expense", fontSize: 11, icPath: AppIcons.icArrowDown),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "\$ ${AppNumberUtils.formatDoubleTwo(balanceAmount.toString())}",
              style: AppTextStyle.whiteS20,
            ),
            Text(
              "-\$ ${AppNumberUtils.formatDoubleTwo(expenseAmount.toString())}",
              style: AppTextStyle.oceanBlueS20Bold,
            ),
          ],
        ),

        // process
        _buildProcessBar(percent),

        // <50% look good >= 50% look bd
        IconText(
          text: percent > 0.5
              ? "${(percent * 100).toInt()}% of your expenses, looks good."
              : "${(percent * 100).toInt()}% of your expenses, looks bad!!",
          icPath: AppIcons.icTick,
          fontSize: 15,
        ),
      ],
    );
  }
  double safePercent(double value, double total) {
    if (total <= 0) return 0;
    final p = value / total;
    if (p.isNaN || p.isInfinite) return 0;
    return p.clamp(0.0, 1.0);
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
            child: Text("${(100 - percent * 100).toInt()}%", style: AppTextStyle.whiteS12Light),
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
                child: Text("\$20,000.00", style: AppTextStyle.greenDarkMediumS14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
