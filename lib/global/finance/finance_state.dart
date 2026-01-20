import 'package:equatable/equatable.dart';

class FinanceState extends Equatable {
  final double totalBalance;
  final double totalExpense;

  const FinanceState({this.totalBalance = 0, this.totalExpense = 0});

  // copy with
  FinanceState copyWith({double? totalBalance, double? totalExpense}) {
    return FinanceState(
      totalBalance: totalBalance ?? this.totalBalance,
      totalExpense: totalExpense ?? this.totalExpense,
    );
  }

  @override
  List<Object?> get props => [totalBalance, totalExpense];
}
