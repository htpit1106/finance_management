import 'package:equatable/equatable.dart';
import 'package:finance_management/model/entity/saving_categories/saving_category_entity.dart';

class SavingsState extends Equatable {
  final List<SavingCategoryEntity> savingCategories;

  const SavingsState({ this.savingCategories = const []});

  SavingsState copyWith({List<SavingCategoryEntity>? savingCategories}) {
    return SavingsState(savingCategories: savingCategories ?? this.savingCategories);
  }
  @override
  List<Object?> get props => [savingCategories];
}
