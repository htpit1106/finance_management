import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:finance_management/ui/widgets/background_app.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:finance_management/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      heightHeader: 320,
      header: _buildHeaderPage(),
      body: _buildGridViewCategory(context),
    );
  }

  _buildHeaderPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 40),
              Center(child: Text("Categories", style: AppTextStyle.greenDarkBoldS20)),

              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppIcons.icNotification),
                iconSize: 40,
              ),
            ],
          ),
        ),
        AppHeader(),
      ],
    );
  }

  _buildGridViewCategory(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),

      children: [
        _iconButtonLabel(context, iconPath: AppIcons.icFood, label: "Food"),
        _iconButtonLabel(context, iconPath: AppIcons.icTransport, label: "Transport"),
        _iconButtonLabel(context, iconPath: AppIcons.icMedicine, label: "Medicine"),
        _iconButtonLabel(context, iconPath: AppIcons.icGroceries, label: "Groceries"),
        _iconButtonLabel(context, iconPath: AppIcons.icRent, label: "Rent"),
        _iconButtonLabel(context, iconPath: AppIcons.icGifts, label: "Gifts"),
        _iconButtonLabel(context, iconPath: AppIcons.icSavings, label: "Savings"),
        _iconButtonLabel(context, iconPath: AppIcons.icEntertainment, label: "Entertainment"),
        _iconButtonLabel(context, iconPath: AppIcons.icMore, label: "More"),


      ],
    );


  }

  _iconButtonLabel(BuildContext context, {required String iconPath, required String label}){
    return Column(
      children: [
        AppIconButton(iconPath: iconPath, size: 90, isActive: false, onTap: (){
          context.push(AppRouter.categoryTransaction, extra: label);

        },),
        Text(label, style: AppTextStyle.greenDarkS14)
      ],
    );
  }
}
