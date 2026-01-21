import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/global/finance/finance_cubit.dart';
import 'package:finance_management/global/finance/finance_state.dart';
import 'package:finance_management/model/enum/time_filter.dart';
import 'package:finance_management/repository/summary_repository.dart';
import 'package:finance_management/ui/page/home/home_cubit.dart';
import 'package:finance_management/ui/page/home/home_state.dart';
import 'package:finance_management/ui/page/home/widget/list_time_filter.dart';
import 'package:finance_management/ui/widgets/transaction_item.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:finance_management/utils/categories_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        return HomeCubit(
          repository: context.read<SummaryRepository>(),
          financeCubit: context.read<FinanceCubit>(),
        );
      },
      child: HomePageChild(),
    );
  }
}

class HomePageChild extends StatefulWidget {
  const HomePageChild({super.key});

  @override
  State<HomePageChild> createState() => _HomePageChildState();
}

class _HomePageChildState extends State<HomePageChild> {
  int selectedIndex = 0;
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.fetchInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      heightHeader: 330,
      header: _buildHeader(),
      body: Column(
        children: [
          _buildSavingCard(),
          SizedBox(height: 20),
          _buildListTimeFilter(),
          Expanded(child: _buildListTransaction()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, Welcome Back", style: AppTextStyle.greenDarkBoldS20),
                Text("Good Morning", style: AppTextStyle.greenDarkLightS14),
              ],
            ),
            IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.icNotification)),
          ],
        ),
        SizedBox(height: 10),
        BlocBuilder<FinanceCubit, FinanceState>(
          buildWhen: (previous, current) =>
              previous.totalBalance != current.totalBalance ||
              previous.totalExpense != current.totalExpense,
          builder: (context, state) {
            return AppHeader(balanceAmount: state.totalBalance, expenseAmount: state.totalExpense);
          },
        ),
      ],
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

  Widget _buildListTimeFilter() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.selectedTimeFilter != current.selectedTimeFilter,
      builder: (context, state) {
        return ListTimeFilter(
          listTime: ['Daily', 'Weekly', 'Monthly'],
          selectedIndex: state.selectedTimeFilter.index,
          onTap: (index) {
            _cubit.changeTimeFilter(TimeFilter.values[index]);
          },
        );
      },
    );
  }

  Widget _buildListTransaction() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.categorySummaryList != current.categorySummaryList,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.categorySummaryList.length,
          itemBuilder: (context, index) {
            final data = state.categorySummaryList[index];
            return TransactionItem(
              title: data.categoryName ?? "no title",
              amount: AppNumberUtils.formatDoubleTwo(data.totalAmount.toString()),
              iconPath: CategoriesUtils.getIcon(data.categoryName ?? ""),
            );
          },
        );
      },
    );
  }
}
