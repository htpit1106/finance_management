import 'package:finance_management/model/transactions/transaction_entity.dart';
import 'package:finance_management/network/supabase_util.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTransactionsByCategoryId(String categoryId);

  Future<void> addTransaction({required TransactionEntity transaction});

  Future<void> updateTransaction({required TransactionEntity transaction});

  Future<void> deleteTransaction({required TransactionEntity transaction});
}

class TransactionRepositoryImpl extends TransactionRepository {
  final supabaseClient = SupabaseUtil.client;

  @override
  Future<void> addTransaction({required TransactionEntity transaction}) async {
    await supabaseClient.from("transactions").insert(transaction.toJson()).select();
  }

  @override
  Future<void> deleteTransaction({required TransactionEntity transaction}) async {
    if (transaction.id == null) return;
    supabaseClient.from("transactions").delete().eq("id", transaction.id!);
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByCategoryId(String categoryId) async {
    final data = await supabaseClient.from("transactions").select().eq("category_id", categoryId);

    return data.map((e) => TransactionEntity.fromJson(e)).toList();
  }

  @override
  Future<void> updateTransaction({required TransactionEntity transaction}) async {
    if (transaction.id != null) {
      supabaseClient.from("transactions").update(transaction.toJson()).eq("id", transaction.id!);
    }
  }
}
