import 'package:finance_management/global/finance/finance_cubit.dart';
import 'package:finance_management/global/finance/finance_state.dart';
import 'package:finance_management/model/enum/saving_categories.dart';
import 'package:finance_management/repository/category_repository.dart';
import 'package:finance_management/ui/page/categories/savings/savings_cubit.dart';
import 'package:finance_management/ui/page/categories/savings/savings_navigator.dart';
import 'package:finance_management/ui/page/categories/savings/savings_state.dart';
import 'package:finance_management/ui/page/categories/widget/icon_button_label.dart';
import 'package:finance_management/ui/widgets/app_bar/app_bar_widget.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_savings_dialog/add_savings_dialog.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavingsCubit>(
      create: (context) => SavingsCubit(
        navigator: SavingsNavigator(context: context),
        repository: context.read<CategoryRepository>(),
      ),
      child: const SavingsPageChild(),
    );
  }
}

class SavingsPageChild extends StatefulWidget {
  const SavingsPageChild({super.key});

  @override
  State<SavingsPageChild> createState() => _SavingsPageChildState();
}

class _SavingsPageChildState extends State<SavingsPageChild> {
  late final SavingsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SavingsCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(heightHeader: 350, header: _buildHeaderPage(), body: _buildBodyPage());
  }

  _buildHeaderPage() {
    return Column(
      children: [
        AppBarWidget(title: "Savings"),
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

  _buildBodyPage() {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<SavingsCubit, SavingsState>(
            buildWhen: (previous, current) => previous.savingCategories != current.savingCategories,

            builder: (context, state) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 25,

                ),
                itemCount: state.savingCategories.length,
                itemBuilder: (context, index) {
                  final category = state.savingCategories[index];
                  final type = ExtensionSavingCategories.fromApiName(category.name);
                  return IconButtonLabel(
                    label: category.name ?? "",
                    iconPath: type.iconPath,

                    onTap: () {
                      _cubit.onPressAddSavings(category);
                    },
                  );
                },
              );
            },
          ),
        ),
        AppTextButton(
          text: "Add More",
          minHeight: 44,
          onTap: () {
            _showAddSavingsDialog(context);
          },
        ),
      ],
    );
  }

  void _showAddSavingsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (_) => const AddSavingsDialog(),
    );
  }
}
