import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/ui/widgets/app_bar/app_bar_widget.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'add_expenses_cubit.dart';
import 'add_expenses_navigator.dart';

class AddExpensesPage extends StatelessWidget {
  final CategoryEntity category;

  const AddExpensesPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddExpensesCubit>(
      create: (context) {
        return AddExpensesCubit(
          navigator: AddExpensesNavigator(context: context),
          repository: context.read(),
          category: category,
        );
      },
      child: AddExpensesPageChild(category: category),
    );
  }
}

class AddExpensesPageChild extends StatefulWidget {
  final CategoryEntity category;

  const AddExpensesPageChild({super.key, required this.category});

  @override
  State<AddExpensesPageChild> createState() => _AddExpensesPageChildState();
}

class _AddExpensesPageChildState extends State<AddExpensesPageChild> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _dateController;
  late final TextEditingController _categoryController;
  late final TextEditingController _amountController;
  late final TextEditingController _titleController;
  late final TextEditingController _messageController;
  late final AddExpensesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: DateTime.now().toString());
    _categoryController = TextEditingController(text: widget.category.name);
    _amountController = TextEditingController();
    _titleController = TextEditingController();
    _messageController = TextEditingController();
    _cubit = context.read<AddExpensesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      heightHeader: 170,
      header: AppBarWidget(title: "Add Expenses"),
      body: _buildFormSubmit(),
    );
  }

  _buildFormSubmit() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            AppTextFieldLabel(
              labelText: "Date",
              hintText: "30/APR/2023",
              controller: _dateController,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(AppIcons.icCalendar, width: 22, height: 22),
              ),
            ),
            AppTextFieldLabel(
              labelText: "Category",
              controller: _categoryController,
              hintText: "Select the category",
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(AppIcons.icArrowDropDown),
              ),
            ),
            AppTextFieldLabel(
              labelText: "Amount",
              hintText: "\$3.53",
              controller: _amountController,
            ),
            AppTextFieldLabel(
              labelText: "Expense Title",
              hintText: "Fuel",
              controller: _titleController,
            ),
            AppTextFieldLabel(
              hintText: "Enter Message",
              maxLines: 7,
              hintTextStyle: AppTextStyle.greenS15Medium,
              controller: _messageController,
            ),
            AppTextButton(
              text: "Save",
              minHeight: 44,
              minWidth: 160,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _cubit.onPressSave(
                    title: _titleController.text,
                    message: _messageController.text,
                    amount: _amountController.text,
                    date: _dateController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
