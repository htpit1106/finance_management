import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/card/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TransactionPageChild();
  }
}

class TransactionPageChild extends StatefulWidget {
  const TransactionPageChild({super.key});

  @override
  State<TransactionPageChild> createState() => _TransactionPageChildState();
}

class _TransactionPageChildState extends State<TransactionPageChild> {
  @override
  Widget build(BuildContext context) {
    return AppBackground(heightHeader: 370, header: _buildHeader());
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 40),
              Center(child: Text("Transaction", style: AppTextStyle.greenDarkBoldS20)),

              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppIcons.icNotification),
                iconSize: 40,
              ),
            ],
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.lightBackground,
            ),
            child: Column(
              children: [
                Text("Total Balance"),
                Text("\$7,783.00", style: AppTextStyle.greenDarkBoldS20),
              ],
            ),
          ),

          SizedBox(height: 15),

          Row(
            spacing: 20,
            children: [
              Flexible(flex: 1, child: SummaryCard()),
              Flexible(
                flex: 1,
                child: SummaryCard(
                  iconPath: AppIcons.icArrowDown,
                  title: "Expense",
                  amount: 3000.0,
                  iconColor: AppColors.oceanBlue,
                  textAmountColor: AppColors.oceanBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
