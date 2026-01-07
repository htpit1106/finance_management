import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class AnalysisNavigator extends AppNavigator {
  AnalysisNavigator({required super.context});

  void goSearchPage() {
    context.push(AppRouter.searchPage);
  }

}