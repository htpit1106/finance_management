import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String iconPath;
  final bool isActive;
  final String title;
  final String subTitle;
  final String type;
  final String amount;


  const TransactionItem({
    super.key,
    this.iconPath = AppIcons.icNext1,
    this.isActive = false,
    this.title = "",
    this.subTitle = "",
    this.type = "",
    this.amount = "",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        AppIconButton(iconPath: iconPath, isActive: isActive, ),

        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.greenDarkS15,
                overflow: TextOverflow.fade,
                maxLines: 1,

              ),
              Text(
                subTitle,
                style: AppTextStyle.oceanBlueS12,
                overflow: TextOverflow.fade,
                softWrap: false,

                maxLines: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 36, child: VerticalDivider(color: AppColors.dividerGreen, thickness: 0.5)),
        Flexible(
          flex: 2,
          child: Text(
            type,
            style: AppTextStyle.greenDarkLightS13,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(height: 36, child: VerticalDivider(color: AppColors.dividerGreen, thickness: 0.5)),
        Text(amount, style: AppTextStyle.greenDarkS15),
      ],
    );
  }
}
