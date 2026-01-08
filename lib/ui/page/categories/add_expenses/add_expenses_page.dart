import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddExpensesPage extends StatelessWidget {
  const AddExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddExpensesPageChild();
  }
}

class AddExpensesPageChild extends StatefulWidget {
  const AddExpensesPageChild({super.key});

  @override
  State<AddExpensesPageChild> createState() => _AddExpensesPageChildState();
}

class _AddExpensesPageChildState extends State<AddExpensesPageChild> {
  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 170,
      header: _buildHeader(),
      body: _buildFormSubmit(),
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(
            AppIcons.icBack,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.icNotification),
            iconSize: 40,
          ),
        ],
        title: Center(child: Text("Add Expenses", style: AppTextStyle.greenDarkBoldS20)),
      ),
    );
  }
  _buildFormSubmit (){
    return Form(
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
        
            AppTextFieldLabel(
              labelText: "Date",
              hintText: "30/APR/2023",
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(AppIcons.icCalendar, width: 22, height: 22),
              ),
            ),
            AppTextFieldLabel(
              labelText: "Category",
              hintText: "Select the category",
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(AppIcons.icArrowDropDown),
              ),
            ),
            AppTextFieldLabel(
              labelText: "Amount",
              hintText: "\$3.53",
        
            ),
            AppTextFieldLabel(
              labelText: "Expense Title",
              hintText: "Fuel",
        
            ),
            AppTextFieldLabel(
              hintText: "Enter Message",
              maxLines: 7,
              hintTextStyle: AppTextStyle.greenS15Medium,

            ),
            AppTextButton(
              text: "Save",
              minHeight: 44,
              minWidth: 160,
              onTap: (){},
            )
          ],
        ),
      ),
    );
  }

}

