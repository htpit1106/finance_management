import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'button/app_icon_button.dart';

class SimpleTransactionItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subTitle;
  final String amount;
  final Color backgroundColor;

  const SimpleTransactionItem({super.key,
  this.iconPath = AppIcons.icFood,
    this.title = "Dinner",
  this.subTitle = "18:27 - April 30",
  this.amount = "-\$26,00",
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(0),
      child: ListTile(

        leading: AppIconButton(iconPath: iconPath),
        title: Text(title, style: AppTextStyle.greenDarkS15,),
        subtitle: Text(subTitle, style: AppTextStyle.oceanBlueS12,),
        trailing: Text(amount, style: AppTextStyle.greenDarkS15,),

      ),
    );
  }
}
