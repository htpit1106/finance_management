import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:flutter/material.dart';

class GoalProgressBar extends StatelessWidget {
  final double percent;
  final double target;
  final Color primaryColor;
  final Color secondaryColor;

  const GoalProgressBar({super.key, this.percent = 0.8, this.target = 2000000,
  this.primaryColor = AppColors.whiteIcon, this.secondaryColor = AppColors.blackText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        children: [
          Container(
            height: 28,
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(50)),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: percent,
              child: Container(
                height: 28,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "${(percent * 100).toInt()}%",
                  style: AppTextStyle.whiteS12Light,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,

            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 4),
              child: Text(
                "\$${AppNumberUtils.formatDoubleTwo(target.toString())}",
                style: percent > 0.8
                    ? AppTextStyle.whiteS14Medium
                    : AppTextStyle.greenDarkMediumS14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
