import 'package:bloc/bloc.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/ui/page/categories/savings/detail_savings/detail_savings_navigator.dart';

import 'detail_savings_state.dart';

class DetailSavingsCubit extends Cubit<DetailSavingsState> {
  final DetailSavingsNavigator navigator;


  DetailSavingsCubit({required this.navigator})
    : super(DetailSavingsState());

  void onPressAddExpenses() async {
    final result = await navigator.pushAddExpenses(category: CategoryEntity());
    if (result == true) {
      // fetchTransactions();
    }
  }


}
