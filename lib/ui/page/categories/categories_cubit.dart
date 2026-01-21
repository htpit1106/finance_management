import 'package:bloc/bloc.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/repository/category_repository.dart';
import 'package:finance_management/ui/page/categories/categories_navigator.dart';
import 'package:finance_management/ui/page/categories/category_state.dart';
import 'package:flutter/material.dart';

class CategoriesCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  final CategoriesNavigator navigator;

  CategoriesCubit({required this.categoryRepository, required this.navigator})
    : super(
        CategoryState(
          categories: [],
          selectedCategory: CategoryEntity(name: "Food"),
        ),
      );

  Future<void> fetchCategories() async {
    try {
      final categories = await categoryRepository.getCategoriesByType(TypeTransaction.expense);
      emit(state.copyWith(categories: categories));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void selectCategory(CategoryEntity category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void onPressCategoriesBtn() {
    if (state.selectedCategory.name == "Savings") {
      navigator.pushSavingPage(state.selectedCategory);
      return;
    }
    navigator.pushCategoryTransaction(state.selectedCategory);
  }
}
