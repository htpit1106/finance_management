import 'package:bloc/bloc.dart';
import 'package:finance_management/global/finance/finance_state.dart';
import 'package:finance_management/repository/summary_repository.dart';

class FinanceCubit extends Cubit<FinanceState> {
  final SummaryRepository repository;

  FinanceCubit({required this.repository}) : super(const FinanceState());

  Future<void> fetchIncomeData() async {
    final data = await repository.getTotalIncomeExpense();
    emit(
      state.copyWith(
        totalBalance: (data["income"] ?? 0) - (data["expense"] ?? 0),
        totalExpense: data["expense"] ?? 0,
      ),
    );
  }
}
