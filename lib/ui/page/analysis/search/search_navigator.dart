import 'package:finance_management/common/app_navigator.dart';
import 'package:go_router/go_router.dart';

class SearchNavigator extends AppNavigator {
  SearchNavigator({required super.context});

  // pop

  void goBack() {
    context.pop();
  }
}
