import 'package:equatable/equatable.dart';
import 'package:finance_management/model/entity/transactions/transaction_entity.dart';

class DetailSavingsState extends Equatable {
  final List<TransactionEntity> transactions;
  final bool isLoadingTransaction;
  final double currentAmount;
  final double targetAmount;

  const DetailSavingsState({
    this.transactions = const [],
    this.isLoadingTransaction = true,
    this.currentAmount = 0,
    this.targetAmount = 0,
  });

  DetailSavingsState copyWith({
    List<TransactionEntity>? transactions,
    bool? isLoadingTransaction,
    double? currentAmount,
    double? targetAmount,
  }) {
    return DetailSavingsState(
      transactions: transactions ?? this.transactions,
      isLoadingTransaction: isLoadingTransaction ?? this.isLoadingTransaction,
      currentAmount: currentAmount ?? this.currentAmount,
      targetAmount: targetAmount ?? this.targetAmount,
    );
  }

  // copy with
  @override
  List<Object?> get props => [transactions, isLoadingTransaction, currentAmount, targetAmount];
}
