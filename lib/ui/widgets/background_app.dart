import 'package:finance_management/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final double heightHeader;
  final AppBar? appBar;

  const AppBackground({super.key, this.header, this.body, this.heightHeader = 250, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,

            child: Container(
              alignment: Alignment.topCenter,
              height: heightHeader,
              width: double.infinity,
              color: AppColors.backgroundColor,
              child: SafeArea(bottom: false, child: header ?? const Text("Welcome")),
            ),
          ),

          /// BODY
          Positioned(
            top: heightHeader - 0.2* heightHeader,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.lightBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: body ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
