import 'package:equatable/equatable.dart';
import 'package:finance_management/model/categories/category_summary/category_summary_entity.dart';
import 'package:finance_management/model/enum/time_filter.dart';

class HomeState extends Equatable {
  final double totalBalance;
  final double totalExpense;
  final TimeFilter selectedTimeFilter;
  final List<CategorySummaryEntity> categorySummaryList;

  const HomeState({
    this.categorySummaryList = const [],
    this.selectedTimeFilter = TimeFilter.daily,
    this.totalBalance = 0,
    this.totalExpense = 0,
  });

  HomeState copyWith({
    List<CategorySummaryEntity>? categorySummaryList,
    TimeFilter? selectedTimeFilter,
    double? totalBalance,
    double? totalExpense,
  }) {
    return HomeState(
      categorySummaryList: categorySummaryList ?? this.categorySummaryList,
      selectedTimeFilter: selectedTimeFilter ?? this.selectedTimeFilter,
      totalBalance: totalBalance ?? this.totalBalance,
      totalExpense: totalExpense ?? this.totalExpense,
    );
  }

  @override
  List<Object?> get props => [categorySummaryList, selectedTimeFilter, totalBalance, totalExpense];
}
