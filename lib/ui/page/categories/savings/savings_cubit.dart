import 'package:bloc/bloc.dart';
import 'package:finance_management/repository/category_repository.dart';
import 'package:finance_management/ui/page/categories/savings/savings_navigator.dart';
import 'package:finance_management/ui/page/categories/savings/savings_state.dart';
import 'package:flutter/material.dart';

class SavingsCubit extends Cubit<SavingsState> {
  final SavingsNavigator navigator;

  final CategoryRepository repository;
  SavingsCubit({required this.navigator, required this.repository}) : super(SavingsState());
  Future<void> fetchCategories() async {
    try {
      final data = await repository.getSavingCategories();
      emit(state.copyWith(savingCategories: data));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  void onPressAddSavings() {
    navigator.pushDetailSaving();

  }
}
