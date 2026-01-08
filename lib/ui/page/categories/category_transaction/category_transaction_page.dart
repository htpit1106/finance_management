import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_text_button.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CategoryTransactionPage extends StatelessWidget {
  final String category;

  const CategoryTransactionPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return CategoryTransactionPageChild(category: category);
  }
}

class CategoryTransactionPageChild extends StatefulWidget {
  final String category;

  const CategoryTransactionPageChild({super.key, required this.category});

  @override
  State<CategoryTransactionPageChild> createState() => _CategoryTransactionPageChildState();
}

class _CategoryTransactionPageChildState extends State<CategoryTransactionPageChild> {
  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 340,
      header: _buildHeaderPage(),
      body: _buildBody(),

    );
  }

  _buildHeaderPage() {
    return Column(
      children: [
        Padding(
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
            title: Center(child: Text("Calendar", style: AppTextStyle.greenDarkBoldS20)),
          ),
        ),
        AppHeader(),
      ],
    );
  }

  _buildBody() {
    return Column(
      children: [
        Expanded(child: Text(widget.category, style: AppTextStyle.greenDarkBoldS20)),

        AppTextButton(
          text: "Add Expenses",
          minHeight: 44,
          onTap: () {
            context.push(AppRouter.addExpenses);
          },
        )
      ],
    );
  }
}
