import 'package:finance_management/model/entity/categories/category_entity.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>?> getCategoriesByType(TypeTransaction type);
}

class CategoryRepositoryImpl extends CategoryRepository {
  final supabaseClient = SupabaseUtil.client;

  @override
  Future<List<CategoryEntity>?> getCategoriesByType(TypeTransaction type) async {
    try {


      final data = await supabaseClient.from("categories").select().eq("type", type.name);
      return data.map((e) => CategoryEntity.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

}
