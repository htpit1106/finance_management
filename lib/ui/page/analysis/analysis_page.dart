import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/global/finance/finance_cubit.dart';
import 'package:finance_management/global/finance/finance_state.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:finance_management/ui/page/analysis/widgets/income_expense_chart.dart';
import 'package:finance_management/ui/page/home/widget/list_time_filter.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/target_button.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 350,
      header: _buildHeaderPage(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            _buildListTimeFilter(),
            Text("My Target", style: AppTextStyle.greenDarkS15),
            _buildListTarget(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderPage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 40),
            Center(child: Text("Analysis", style: AppTextStyle.greenDarkBoldS20)),

            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.icNotification),
              iconSize: 40,
            ),
          ],
        ),
        BlocBuilder<FinanceCubit, FinanceState>(
          buildWhen: (previous, current) =>
          previous.totalBalance != current.totalBalance ||
              previous.totalExpense != current.totalExpense,
          builder: (context, state) {
            return AppHeader(
              balanceAmount: state.totalBalance,
              expenseAmount: state.totalExpense,
            );
          },
        ),

      ],
    );
  }

  Widget _buildListTimeFilter() {
    return Column(
      children: [
        ListTimeFilter(
          listTime: ['Daily', 'Weekly', 'Monthly', 'Year'],
          selectedIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),

        SizedBox(height: 20),
        _buildIncomeExpenseChart(),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildIncomeExpenseChart() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.navBottonBg,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderChart(),
          const SizedBox(height: 16),
          SizedBox(height: 200, child: IncomeExpenseChart()),
        ],
      ),
    );
  }

  _buildHeaderChart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text("Income & Expense", style: AppTextStyle.greenDarkS15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                context.push(AppRouter.searchPage);
              },
              child: Padding(padding: EdgeInsets.zero, child: Image.asset(AppIcons.icSearch)),
            ),

            SizedBox(width: 5),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                context.push(AppRouter.calenderPage);
              },
              child: Padding(padding: EdgeInsets.zero, child: Image.asset(AppIcons.icCalendar)),
            ),
          ],
        ),
      ],
    );
  }

  _buildListTarget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [TargetButton(percent: 30, targetName: "Travel",), SizedBox(width: 10), TargetButton(percent: 50, targetName: "Car",)],
    );
  }
}
