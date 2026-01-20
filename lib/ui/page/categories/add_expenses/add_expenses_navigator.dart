import 'package:finance_management/common/app_navigator.dart';
import 'package:go_router/go_router.dart';

class AddExpensesNavigator extends AppNavigator {
  AddExpensesNavigator({required super.context});
  // back
  void goback({bool? result}) {
    context.pop(result ?? true);
  }
}
