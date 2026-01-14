import 'package:bloc/bloc.dart';
import 'package:finance_management/model/enum/time_filter.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/repository/summary_repository.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SummaryRepository repository;

  HomeCubit({required this.repository}) : super(HomeState());

  Future<void> fetchInitialData() async {
    fetchIncomeData();
    filterDataByTimeFilter();
  }

  Future<void> fetchIncomeData() async {
    final data = await repository.getTotalIncomeExpense();
    emit(
      state.copyWith(
        totalBalance: (data["income"] ?? 0 ) - (data["expense"] ?? 0),
        totalExpense: data["expense"] ?? 0,
      ),
    );
  }

  Future<void> filterDataByTimeFilter({TypeTransaction type = TypeTransaction.expense}) async {
    try {
      final data = await repository.getCategorySummary(
        from: state.selectedTimeFilter.getDateTime(),
        to: DateTime.now(),
        type: type,
      );
      emit(state.copyWith(categorySummaryList: data));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // filter data by type filter
  void changeTimeFilter(TimeFilter timeFilter) {
    emit(state.copyWith(selectedTimeFilter: timeFilter));
    filterDataByTimeFilter();
  }
}
