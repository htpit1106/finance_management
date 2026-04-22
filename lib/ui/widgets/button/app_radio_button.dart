import 'package:finance_management/common/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppRadioButton extends StatelessWidget {
  final String? label;
  final bool? checked;
  final VoidCallback? onTap;

  const AppRadioButton({super.key, this.label, this.checked, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          icon: checked == true
              ? SvgPicture.asset(AppIcons.icCheckedPoint)
              : SvgPicture.asset(AppIcons.icUnCheckedPoint),
        ),
        SizedBox(width: 10),
        Text(label ?? ""),
      ],
    );
  }
}
