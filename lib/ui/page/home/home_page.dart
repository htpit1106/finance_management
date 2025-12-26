import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/home/widget/filter_button.dart';
import 'package:finance_management/ui/page/home/widget/transaction_item.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePageChild();
  }
}

class HomePageChild extends StatefulWidget {
  const HomePageChild({super.key});

  @override
  State<HomePageChild> createState() => _HomePageChildState();
}

class _HomePageChildState extends State<HomePageChild> {
  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 350,
      header: Header(),
      body: SingleChildScrollView(
        child: Column(spacing: 20, children: [_buildSavingCard(), _buildListTimeFilter()]),
      ),
    );
  }

  Widget _buildListTimeFilter() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.navBottonBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: FilterButton(text: "Daily", isActive: true)),
              Expanded(flex: 1, child: FilterButton(text: "Weekly", isActive: false)),
              Expanded(flex: 1, child: FilterButton(text: "Monthly", isActive: false)),
            ],
          ),
        ),
        SizedBox(height: 20,),
        _buildListTransaction(),
      ],
    );
  }

  Widget _buildListTransaction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [_buildTransaction(), SizedBox(height: 20), _buildTransaction()],
    );
  }

  Widget _buildTransaction() {
    return TransactionItem(
      iconPath: AppIcons.icSalary,
      title: "Salary",
      subTitle: "18:27 - April 30",
      type: "Monthly",
      amount: "\$20,000.00",
      isActive: false,
    );
  }

  Widget _buildSavingCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.caribbeanGreen,
        borderRadius: BorderRadius.circular(31),
      ),
      child: Row(
        spacing: 10,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),

                      child: SvgPicture.asset(AppIcons.icCar),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: 0.5,
                        color: AppColors.vividBlue,
                        strokeWidth: 3,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),

                Text(
                  "Savings On Goals",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.greenDarkS12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: const VerticalDivider(
              color: Colors.white,
              thickness: 3,
              radius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              spacing: 5,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    SvgPicture.asset(AppIcons.icSalary),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Revenue Last Week", style: AppTextStyle.greenDarkS12),
                        Text("\$4,000.00", style: AppTextStyle.greenDarkBoldS15),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  child: const Divider(
                    color: Colors.white,
                    thickness: 3,
                    radius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),

                Row(
                  spacing: 10,
                  children: [
                    SvgPicture.asset(AppIcons.icFood),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Food Last Week", style: AppTextStyle.greenDarkS12),
                        Text("-\$100.00", style: AppTextStyle.oceanBlueS15Bold),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // white divider - Divider Widget
        ],
      ),
    );
  }
}
