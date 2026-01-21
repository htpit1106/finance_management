import 'package:equatable/equatable.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';

class SavingsState extends Equatable {
  final List<CategoryEntity> savingCategories;

  const SavingsState({ this.savingCategories = const []});

  SavingsState copyWith({List<CategoryEntity>? savingCategories}) {
    return SavingsState(savingCategories: savingCategories ?? this.savingCategories);
  }
  @override
  List<Object?> get props => [savingCategories];
}
