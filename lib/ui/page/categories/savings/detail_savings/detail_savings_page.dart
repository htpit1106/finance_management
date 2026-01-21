import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/model/enum/saving_categories.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/repository/summary_repository.dart';
import 'package:finance_management/repository/transaction_repository.dart';
import 'package:finance_management/ui/page/home/widget/icon_text.dart';
import 'package:finance_management/ui/widgets/app_bar/app_bar_widget.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/button/target_button.dart';
import 'package:finance_management/ui/widgets/progress/goal_progress_bar.dart';
import 'package:finance_management/ui/widgets/simple_transaction_item.dart';
import 'package:finance_management/utils/app_date_utils.dart';
import 'package:finance_management/utils/app_number_utils.dart';
import 'package:finance_management/utils/categories_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'detail_savings_cubit.dart';
import 'detail_savings_navigator.dart';
import 'detail_savings_state.dart';

class DetailSavingsPage extends StatelessWidget {
  final CategoryEntity category;

  const DetailSavingsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailSavingsCubit>(
      create: (context) => DetailSavingsCubit(
        navigator: DetailSavingsNavigator(context: context),
        repository: context.read<TransactionRepository>(),
        summaryRepository: context.read<SummaryRepository>(),
      ),
      child: DetailSavingsPageChild(category: category),
    );
  }
}

class DetailSavingsPageChild extends StatefulWidget {
  final CategoryEntity category;

  const DetailSavingsPageChild({super.key, required this.category});

  @override
  State<DetailSavingsPageChild> createState() => _DetailSavingsPageChildState();
}

class _DetailSavingsPageChildState extends State<DetailSavingsPageChild> {
  late final DetailSavingsCubit _cubit;
  double percent = 0;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<DetailSavingsCubit>();
    _cubit.fetchCategoryTransaction(widget.category.id ?? "");
  }

  @override
  Widget build(BuildContext context) {


    return AppBackground(
      heightHeader: 150,
      header: AppBarWidget(title: widget.category.name ?? "unknow"),
      body: _buildBodyPage(),
    );
  }

  _buildBodyPage() {
    return Column(
      children: [
        BlocBuilder<DetailSavingsCubit, DetailSavingsState>(
          buildWhen: (previous, current) =>
              previous.currentAmount != current.currentAmount ||
              previous.targetAmount != current.targetAmount,
          builder: (context, state) {
            if (state.targetAmount > 0) {
              percent = state.currentAmount / state.targetAmount;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const IconText(text: "Goal", fontSize: 11, icPath: AppIcons.icArrowUp),
                    Text(
                      "    \$${AppNumberUtils.formatDoubleTwo(state.targetAmount)}",
                      style: AppTextStyle.greenDarkBoldS20,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const IconText(
                      text: "Amount Saved",
                      fontSize: 11,
                      icPath: AppIcons.icArrowDown,
                    ),
                    Text(
                      "      \$${AppNumberUtils.formatDoubleTwo(state.currentAmount)}",
                      style: AppTextStyle.greenDarkBoldS20,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                TargetButton(
                  percent: percent*100,
                  targetName: widget.category.name ?? "unknow",
                  minHeigh: 150,
                  minWidth: 150,
                  icon: SvgPicture.asset(
                    ExtensionSavingCategories.fromApiName(widget.category.name ?? "").iconPath,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),

        // <50% look good >= 50% look bd
        BlocBuilder<DetailSavingsCubit, DetailSavingsState>(
          builder: (context, state) {

            if (state.targetAmount > 0) {
              percent = state.currentAmount / state.targetAmount;
            }
            final percentText = (percent * 100).round();

            return Column(
              children: [
                GoalProgressBar(
                  percent: percent,
                  primaryColor: AppColors.greenBtn,
                  secondaryColor: AppColors.darkBackground,
                  target: state.targetAmount,
                ),
                IconText(
                  text: percent < 0.5
                      ? "$percentText% of your goal, looks good."
                      : "$percentText% of your goal, looks risky!",
                  icPath: AppIcons.icTick,
                  fontSize: 15,
                ),
              ],
            );
          },
        ),

        Expanded(child: _buildListTransactions()),
        AppTextButton(
          text: "Add Saving",
          minHeight: 36,
          onTap: () {
            _cubit.onPressAddSaving(widget.category);
          },
        ),
      ],
    );
  }

  _buildListTransactions() {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<DetailSavingsCubit, DetailSavingsState>(
            buildWhen: (previous, current) =>
                previous.isLoadingTransaction != current.isLoadingTransaction ||
                previous.transactions != current.transactions,
            builder: (context, state) {
              if (state.isLoadingTransaction) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.transactions.isEmpty) {
                return const Center(child: Text("No Transaction"));
              }

              return ListView.builder(
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = state.transactions[index];
                  return SimpleTransactionItem(
                    title: transaction.title ?? "unKnow",
                    subTitle: transaction.date != null
                        ? AppDateUtils.formatTimeTransactionsItem(
                            AppDateUtils.toDateTime(transaction.date!),
                          )
                        : AppDateUtils.formatDateNow(DateTime.now()),
                    amount: transaction.amount.toString(),
                    iconPath: CategoriesUtils.getIcon(widget.category.name ?? "unKnow"),
                    typeTransaction: TypeTransaction.saving,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
