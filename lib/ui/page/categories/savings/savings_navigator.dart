import 'package:finance_management/common/app_navigator.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/router/app_router.dart';
import 'package:go_router/go_router.dart';

class SavingsNavigator extends AppNavigator {
  SavingsNavigator({required super.context});

  void pushDetailSaving(CategoryEntity category){
    context.push(AppRouter.savingsDetail, extra: category);
  }
}
