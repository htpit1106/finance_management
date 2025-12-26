import 'package:finance_management/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  final String iconPath;
  final Color? iconColor;
  final Color? bgDefaultColor;
  final Color? bgPressedColor;
  final double? size;
  final bool isActive;

  const AppIconButton({
    super.key,
    required this.iconPath,
    this.iconColor = Colors.white,
    this.bgDefaultColor = AppColors.lightBlue,
    this.size = 54,
    this.bgPressedColor = AppColors.vividBlue,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isActive ? bgPressedColor : bgDefaultColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(child: SvgPicture.asset(iconPath, color: iconColor,)),
      ),
    );
  }
}
