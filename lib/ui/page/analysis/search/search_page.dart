import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/ui/page/analysis/search/search_navigator.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_radio_button.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/simple_transaction_item.dart';
import 'package:finance_management/ui/widgets/text_field/app_text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchPageChild();
  }
}

class SearchPageChild extends StatefulWidget {
  const SearchPageChild({super.key});

  @override
  State<SearchPageChild> createState() => _SearchPageChildState();
}

class _SearchPageChildState extends State<SearchPageChild> {
  final _formKey = GlobalKey<FormState>();
  bool checkedIncome = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 220,
      header: _buildHeader(),
      body: SingleChildScrollView(
        child: Column(spacing: 20, children: [_buildFormSearch(), const SizedBox(height: 100)]),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          leading: IconButton(
            onPressed: () {
              final navigator = SearchNavigator(context: context);
              navigator.goBack();
            },
            icon: SvgPicture.asset(AppIcons.icBack),
          ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.icNotification),
              iconSize: 40,
            ),
          ],
          title: Center(child: Text("Search", style: AppTextStyle.greenDarkBoldS20)),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            decoration: InputDecoration(hintText: "Search", isDense: true, fillColor: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSearch() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          AppTextFieldLabel(
            labelText: "Categories",
            hintText: "Select the category",
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset(AppIcons.icArrowDropDown),
            ),
          ),
          AppTextFieldLabel(
            labelText: "Date",
            hintText: "30/APR/2023",
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(AppIcons.icCalendar, width: 22, height: 22),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Report", style: AppTextStyle.greenDarkS15),

              Row(
                children: [
                  AppRadioButton(
                    label: "Income",
                    checked: checkedIncome,
                    onTap: () {
                      setState(() {
                        checkedIncome = !checkedIncome;
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  AppRadioButton(
                    label: "Expense",
                    checked: !checkedIncome,
                    onTap: () {
                      setState(() {
                        checkedIncome = !checkedIncome;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),

          Center(
            child: AppTextButton(textButton: "Search", minWidth: 169, minHeight: 44, onTap: () {}),
          ),

          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SimpleTransactionItem(),
              SimpleTransactionItem(),
              SimpleTransactionItem(),
              SimpleTransactionItem(),
              SimpleTransactionItem(),
            ],
          ),

        ],
      ),
    );
  }
}
