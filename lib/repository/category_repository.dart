import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/model/entity/saving_categories/saving_category_entity.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategoriesExpense();
  Future<List<SavingCategoryEntity>> getSavingCategories();
}

class CategoryRepositoryImpl extends CategoryRepository {
  final supabaseClient = SupabaseUtil.client;

  @override
  Future<List<CategoryEntity>> getCategoriesExpense() async {
    try {
      final data = await supabaseClient.from("categories").select();
      return data.map((e) => CategoryEntity.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<SavingCategoryEntity>> getSavingCategories() async{
    try {
      final data = await supabaseClient.from("saving_category").select();
      return data.map((e) => SavingCategoryEntity.fromJson(e)).toList();

    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
