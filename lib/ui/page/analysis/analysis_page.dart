import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/home/widget/filter_button.dart';
import 'package:finance_management/ui/page/home/widget/transaction_item.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:flutter/material.dart';


class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnalysisPageChild();
  }
}

class AnalysisPageChild extends StatefulWidget {
  const AnalysisPageChild({super.key});

  @override
  State<AnalysisPageChild> createState() => _AnalysisPageChildState();
}

class _AnalysisPageChildState extends State<AnalysisPageChild> {
  @override
  Widget build(BuildContext context) {
    return BackgroundApp(

      heightHeader: 310,
      header: _buildHeader(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [ _buildListTimeFilter(), const SizedBox(height: 100)],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Analysis", style: AppTextStyle.greenDarkBoldS20)),


          ],
        ),
        Header()
      ],
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
        SizedBox(height: 20),
        _buildListTransaction(),
      ],
    );
  }

  Widget _buildListTransaction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTransaction(),
        SizedBox(height: 20),
        _buildTransaction(),
        SizedBox(height: 20),
        _buildTransaction(),
      ],
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


}