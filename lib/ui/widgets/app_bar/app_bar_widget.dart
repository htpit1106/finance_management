import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, this.title = "Unknow"});

  @override
  Widget build(BuildContext context) {
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
          icon: SvgPicture.asset(AppIcons.icBack),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.icNotification),
            iconSize: 40,
          ),
        ],
        title: Center(child: Text(title, style: AppTextStyle.greenDarkBoldS20)),
      ),
    );
  }
}
