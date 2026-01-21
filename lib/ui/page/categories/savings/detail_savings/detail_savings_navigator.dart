import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class DetailSavingsNavigator extends AppNavigator {
  DetailSavingsNavigator({required super.context});
  Future<T?> pushAddSavings<T>({required CategoryEntity category}) {
    return context.push<T>(AppRouter.addExpenses, extra: category);
  }
}
