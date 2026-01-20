import 'package:finance_management/common/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconText extends StatelessWidget {
  final String icPath;
  final double fontSize;
  final String text;

  const IconText({super.key, this.icPath = AppIcons.icNext1, this.fontSize = 11, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icPath, width: fontSize, height: fontSize),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
