import 'package:equatable/equatable.dart';
import 'package:finance_management/model/categories/category_entity.dart';
import 'package:finance_management/model/transactions/transaction_entity.dart';

class AddExpensesState extends Equatable{
  final TransactionEntity transaction;
  final CategoryEntity selectedCategory;
  const AddExpensesState({required this.selectedCategory, required this.transaction});

  // copy with
  AddExpensesState copyWith({
    CategoryEntity? selectedCategory,
    TransactionEntity? transaction,
  }) {
    return AddExpensesState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      transaction: transaction ?? this.transaction,
    );
  }
  @override
  List<Object?> get props => [selectedCategory];
}