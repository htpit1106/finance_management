import 'package:finance_management/global/finance/finance_cubit.dart';
import 'package:finance_management/global/finance/finance_state.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/repository/transaction_repository.dart';
import 'package:finance_management/ui/page/categories/category_transaction/category_tranction_cubit.dart';
import 'package:finance_management/ui/widgets/app_bar/app_bar_widget.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:finance_management/ui/widgets/simple_transaction_item.dart';
import 'package:finance_management/utils/app_date_utils.dart';
import 'package:finance_management/utils/categories_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_transaction_navigator.dart';
import 'category_transaction_state.dart';

class CategoryTransactionPage extends StatelessWidget {
  final CategoryEntity category;

  const CategoryTransactionPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryTransactionCubit>(
      create: (context) => CategoryTransactionCubit(
        navigator: CategoryTransactionNavigator(context: context),
        transactionRepository: context.read<TransactionRepository>(),
        category: category,
      ),
      child: CategoryTransactionPageChild(category: category),
    );
  }
}

class CategoryTransactionPageChild extends StatefulWidget {
  final CategoryEntity category;

  const CategoryTransactionPageChild({super.key, required this.category});

  @override
  State<CategoryTransactionPageChild> createState() => _CategoryTransactionPageChildState();
}

class _CategoryTransactionPageChildState extends State<CategoryTransactionPageChild> {
  late final CategoryTransactionCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<CategoryTransactionCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(heightHeader: 340, header: _buildHeaderPage(), body: _buildBody());
  }

  _buildHeaderPage() {
    return Column(
      children: [
        AppBarWidget(title: widget.category.name ?? "unKnow"),
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

  _buildBody() {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<CategoryTransactionCubit, CategoryTransactionState>(
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
                    typeTransaction: transaction.type ?? TypeTransaction.expense,
                  );
                },
              );
            },
          ),
        ),

        AppTextButton(
          text: "Add Expenses",
          minHeight: 44,
          onTap: () {
            _cubit.onPressAddExpenses();
          },
        ),
      ],
    );
  }
}
