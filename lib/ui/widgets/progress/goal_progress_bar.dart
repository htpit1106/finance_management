import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:flutter/material.dart';

class GoalProgressBar extends StatelessWidget {
  final double percent;
  final double target;
  final Color primaryColor;
  final Color secondaryColor;

  const GoalProgressBar({
    super.key,
    this.percent = 0.01, // 1% để test
    this.target = 2000000,
    this.primaryColor = AppColors.whiteIcon,
    this.secondaryColor = AppColors.blackText,
  });

  @override
  Widget build(BuildContext context) {
    final safePercent = percent.clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final barWidth = maxWidth * safePercent;

          // Ngưỡng hiển thị text phần trăm
          final bool isSmall = safePercent < 0.15;

          return Container(
            height: 28,
            width: maxWidth,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            // ClipRRect ở đây là QUAN TRỌNG NHẤT để gọt bo góc cái vạch đen
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Thanh tiến trình màu đen
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: barWidth,
                    child: Container(
                      color: secondaryColor,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 12),
                      child: !isSmall
                          ? Text(
                        "${(safePercent * 100).toInt()}%",
                        style: AppTextStyle.whiteS12Light,
                        maxLines: 1,
                      )
                          : const SizedBox.shrink(),
                    ),
                  ),

                  /// Text % khi thanh quá ngắn (nằm trên nền trắng)
                  if (isSmall && safePercent > 0)
                    Positioned(
                      left: barWidth + 8,
                      child: Text(
                        "${(safePercent * 100).toInt()}%",
                        style: AppTextStyle.greenDarkMediumS12,
                      ),
                    ),

                  /// Số tiền mục tiêu
                  Positioned(
                    right: 12,
                    child: Text(
                      "\$${AppNumberUtils.formatDoubleTwo(target.toString())}",
                      style: safePercent > 0.85
                          ? AppTextStyle.whiteS14Medium
                          : AppTextStyle.greenDarkMediumS14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}