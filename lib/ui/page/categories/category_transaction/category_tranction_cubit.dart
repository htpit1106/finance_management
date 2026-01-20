import 'package:bloc/bloc.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/repository/transaction_repository.dart';
import 'package:flutter/material.dart';

import 'category_transaction_navigator.dart';
import 'category_transaction_state.dart';

class CategoryTransactionCubit extends Cubit<CategoryTransactionState> {
  final CategoryTransactionNavigator navigator;
  final TransactionRepository transactionRepository;

  CategoryTransactionCubit({
    required this.navigator,
    required this.transactionRepository,
    required CategoryEntity category,
  }) : super(
         CategoryTransactionState(isLoadingTransaction: true, transactions: [], category: category),
       );

  Future<void> fetchTransactions() async {
    try {
      if (state.category.id == null) return;
      final transactions = await transactionRepository.getTransactionsByCategoryId(
        state.category.id!,
      );
      emit(state.copyWith(transactions: transactions));
      emit(state.copyWith(isLoadingTransaction: false));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(isLoadingTransaction: false));
    }
  }

  Future<void> onPressAddExpenses() async {
    final result = await navigator.pushAddExpenses<bool>(category: state.category);
    if (result == true) {
      fetchTransactions();
    }
  }
}
