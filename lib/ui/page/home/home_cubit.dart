import 'package:bloc/bloc.dart';
import 'package:finance_management/global/finance/finance_cubit.dart';
import 'package:finance_management/model/enum/time_filter.dart';
import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:finance_management/repository/summary_repository.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SummaryRepository repository;
  final FinanceCubit financeCubit;

  HomeCubit({required this.repository, required this.financeCubit}) : super(HomeState());

  Future<void> fetchInitialData() async {
    financeCubit.fetchIncomeData();
    filterDataByTimeFilter();
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
