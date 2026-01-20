import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:flutter/material.dart';

class IconButtonLabel extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const IconButtonLabel({
    super.key,
    this.iconPath = AppIcons.icFood,
    this.label = "unknow",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          AppIconButton(iconPath: iconPath, size: 90, isActive: false, onTap: onTap),
          Text(label, style: AppTextStyle.greenDarkS14),
        ],
      ),
    );
  }
}
