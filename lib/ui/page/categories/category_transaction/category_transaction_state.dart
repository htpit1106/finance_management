import 'package:equatable/equatable.dart';
import 'package:finance_management/model/categories/category_entity.dart';
import 'package:finance_management/model/transactions/transaction_entity.dart';

class CategoryTransactionState extends Equatable{
  final bool isLoadingTransaction;
  final CategoryEntity category;
  final List<TransactionEntity> transactions;

  const CategoryTransactionState({
    required this.isLoadingTransaction,
    required this.transactions,
    required this.category,
  });
  // copy with
  CategoryTransactionState copyWith({
    bool? isLoadingTransaction,
    List<TransactionEntity>? transactions,
    CategoryEntity? category,
  }){
    return CategoryTransactionState(
      isLoadingTransaction: isLoadingTransaction ?? this.isLoadingTransaction,
      transactions: transactions ?? this.transactions,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [isLoadingTransaction, transactions, category];
}

