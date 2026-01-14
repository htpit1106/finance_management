import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String iconPath;
  final bool isActive;
  final String title;
  final String subTitle;
  final TypeTransaction type;
  final String time;
  final String amount;

  const TransactionItem({
    super.key,
    this.iconPath = AppIcons.icNext1,
    this.isActive = false,
    this.title = "",
    this.subTitle = "April - 30",
    this.type = TypeTransaction.expense,
    this.amount = "",
    this.time = "Daily",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 5,
        children: [
          AppIconButton(iconPath: iconPath, isActive: isActive, iconSize: 24),
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
          SizedBox(
            height: 36,
            child: VerticalDivider(color: AppColors.dividerGreen, thickness: 0.5),
          ),
          Flexible(
            flex: 1,
            child: Text(time, style: AppTextStyle.greenDarkLightS13, maxLines: 1),
          ),
          SizedBox(
            height: 36,
            child: VerticalDivider(color: AppColors.dividerGreen, thickness: 0.5),
          ),
          Text(
            type == TypeTransaction.income ? "+\$$amount" : "-\$$amount",
            style: type == TypeTransaction.income
                ? AppTextStyle.greenDarkS15
                : AppTextStyle.oceanBlueS15Medium,
          ),
        ],
      ),
    );
  }
}
