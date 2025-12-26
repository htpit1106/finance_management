import 'package:finance_management/common/app_colors.dart';
import 'package:finance_management/common/app_icons.dart';
import 'package:finance_management/ui/widgets/button/app_icon_button.dart';
import 'package:flutter/material.dart';

enum MainTab { home, analysis, transaction, categories, profile }

extension MainTapExtension on MainTab {
  // get tab
  AppIconButton get tab {
    switch (this) {
      case MainTab.home:
        return AppIconButton(iconPath: AppIcons.icHome, iconColor: Colors.black, bgDefaultColor: AppColors.greenBtn);
      case MainTab.analysis:
        return AppIconButton(iconPath: AppIcons.icAnalysis, iconColor: Colors.black, bgDefaultColor: AppColors.transparent,);
      case MainTab.transaction:
        return AppIconButton(iconPath: AppIcons.icTransaction, iconColor: Colors.black, bgDefaultColor: AppColors.transparent, );
      case MainTab.categories:
        return AppIconButton(iconPath: AppIcons.icCategories, iconColor: Colors.black, bgDefaultColor: AppColors.transparent, );
      case MainTab.profile:
        return AppIconButton(iconPath: AppIcons.icProfile, iconColor: Colors.black, bgDefaultColor: AppColors.transparent, );

    }
  }
}
