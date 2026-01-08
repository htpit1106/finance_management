import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class CategoriesNavigator extends AppNavigator{
  CategoriesNavigator({required super.context});
  // push categories
  void pushCategoryTransaction(String category) {
    context.push(AppRouter.categoryTransaction, extra: category);
  }

}