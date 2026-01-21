import 'package:bloc/bloc.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/repository/summary_repository.dart';
import 'package:finance_management/repository/transaction_repository.dart';
import 'package:finance_management/ui/page/categories/savings/detail_savings/detail_savings_navigator.dart';

import 'detail_savings_state.dart';

class DetailSavingsCubit extends Cubit<DetailSavingsState> {
  final DetailSavingsNavigator navigator;

  final TransactionRepository repository;
  final SummaryRepository summaryRepository;

  DetailSavingsCubit({
    required this.navigator,
    required this.repository,
    required this.summaryRepository,
  }) : super(DetailSavingsState());

  Future<void> fetchCategoryTransaction(String categoryId) async {
    await getCurrentAmount(categoryId);
    await getTargetAmount(categoryId);
    final transactions = await repository.getTransactionsByCategoryId(categoryId);
    emit(state.copyWith(transactions: transactions));
    emit(state.copyWith(isLoadingTransaction: false));
  }
  double get percent {
    if (state.targetAmount <= 0) return 0;
    return (state.currentAmount / state.targetAmount).clamp(0.0, 1.0);
  }
  Future<void> getCurrentAmount(String categoryId) async {
    final amount = await summaryRepository.getTotalAmountByCategoryId(categoryId: categoryId);
    emit(state.copyWith(currentAmount: amount));
  }
  Future <void> getTargetAmount(String categoryId) async {
    final amount = await summaryRepository.getTargetAmountByCategoryId(categoryId: categoryId);
    emit(state.copyWith(targetAmount: amount));
  }

  void onPressAddSaving(CategoryEntity category) async {
    final result = await navigator.pushAddSavings(category: category);
    if (result == true) {
      // fetchTransactions();
    }
  }
}
