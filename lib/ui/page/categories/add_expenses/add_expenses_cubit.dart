import 'package:bloc/bloc.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/model/entity/transactions/transaction_entity.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:finance_management/repository/transaction_repository.dart';
import 'package:finance_management/ui/page/categories/add_expenses/add_expenses_navigator.dart';
import 'package:finance_management/ui/page/categories/add_expenses/add_expenses_state.dart';
import 'package:flutter/material.dart';

class AddExpensesCubit extends Cubit<AddExpensesState> {
  final AddExpensesNavigator navigator;
  final TransactionRepository repository;
  final String? _userId = SupabaseUtil.client.auth.currentUser?.id;

  AddExpensesCubit({
    required this.navigator,
    required this.repository,
    required CategoryEntity category,
  }) : super(AddExpensesState(selectedCategory: category, transaction: TransactionEntity()));

  void selectCategory(CategoryEntity category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void setTransaction(TransactionEntity transaction) {
    emit(state.copyWith(transaction: transaction));
  }

  Future<void> onPressSave({
    String? title,
    String? message,
    String? amount,
    String? date,
  }) async {
    try {
      if (_userId == null) return;
      final transaction = state.transaction.copywith(
        userId: _userId,
        title: title,
        note: message,
        amount: double.parse(amount ?? "0"),
        categoryId: state.selectedCategory.id,
      );

      await repository.addTransaction(transaction: transaction);
      navigator.goback(result: true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
