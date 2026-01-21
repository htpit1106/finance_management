import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/home/widget/icon_text.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:flutter/material.dart';
import 'progress/goal_progress_bar.dart';

class AppHeader extends StatelessWidget {
  final double balanceAmount;
  final double expenseAmount;

  const AppHeader({super.key, this.balanceAmount = 7783, this.expenseAmount = 1187.4});

  @override
  Widget build(BuildContext context) {
    final percent = safePercent(expenseAmount, balanceAmount);
    return Column(
      spacing: 10,
      children: [
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "-\$ ${AppNumberUtils.formatDoubleTwo(expenseAmount.toString())}",
              style: AppTextStyle.oceanBlueS20Bold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        // process
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GoalProgressBar(percent: percent, target: balanceAmount + expenseAmount,),
        ),

        // <50% look good >= 50% look bd
        IconText(
          text: percent < 0.5
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
}
