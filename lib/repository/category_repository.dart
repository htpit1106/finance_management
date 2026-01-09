import 'package:finance_management/model/categories/category_entity.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';

abstract class CategoryRepository {
  Future <List<CategoryEntity>> getCategories();

}

class CategoryRepositoryImpl extends CategoryRepository {
  final supabaseClient = SupabaseUtil.client;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final data = await supabaseClient.from("categories").select();
      return data.map((e) => CategoryEntity.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;

    }

    }

  }
