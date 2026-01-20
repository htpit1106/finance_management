import 'package:finance_management/common/app_icons.dart';

enum MainTab { home, analysis, transaction, categories, profile }

extension MainTapExtension on MainTab {
  String get icon => {
    MainTab.home: AppIcons.icHome,
    MainTab.analysis: AppIcons.icAnalysis,
    MainTab.transaction: AppIcons.icTransaction,
    MainTab.categories: AppIcons.icCategories,
    MainTab.profile: AppIcons.icProfile,
  }[this]!;
}
