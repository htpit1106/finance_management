import 'package:finance_management/model/categories/category_summary/category_summary_entity.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/network/supabase_util.dart';
import 'package:flutter/material.dart';

abstract class SummaryRepository {
  /*
    get transaction by category
    return list of category summary
    category_id, category_name, total_amount
    total_amount = sum of all transactions in this category
   */
  Future<List<CategorySummaryEntity>> getCategorySummary({
    required DateTime from,
    required DateTime to,
    TypeTransaction type = TypeTransaction.expense,
  });

  // total income and expense
  Future<Map<String, double>> getTotalIncomeExpense({DateTime? from, DateTime? to});
}

class SummaryRepositoryImpl extends SummaryRepository {
  final _userId = SupabaseUtil.client.auth.currentUser?.id;

  @override
  Future<List<CategorySummaryEntity>> getCategorySummary({
    required DateTime from,
    required DateTime to,
    TypeTransaction type = TypeTransaction.expense,
  }) async {
    if (_userId == null) return Future.value([]);
    final res = await SupabaseUtil.client.rpc(
      "get_transactions_grouped",
      params: {
        'p_user_id': _userId,
        'p_from': from.toIso8601String(),
        'p_to': to.toIso8601String(),
        'p_type': type.name,
      },
    );
    final list = res as List;
    return list.map((e) => CategorySummaryEntity.fromJson(e)).toList();
  }

  @override
  Future<Map<String, double>> getTotalIncomeExpense({DateTime? from, DateTime? to}) async {
    try {
      if (_userId == null) {
        return {"income": 0, "expense": 0};
      }
      final res = await SupabaseUtil.client.rpc(
        "get_total_income_expense",
        params: {
          'p_user_id': _userId,
          'p_from': from?.toIso8601String(),
          'p_to': to?.toIso8601String(),
        },
      );

      final data = (res as List).first;

      return {
        "income": (data["total_income"] as num).toDouble() ,
        "expense": (data["total_expense"] as num).toDouble(),
      };
    } catch (e) {
      debugPrint(e.toString());
      return {"income": 0, "expense": 0};
    }
  }
}
