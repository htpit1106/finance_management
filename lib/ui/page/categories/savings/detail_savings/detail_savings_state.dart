import 'package:equatable/equatable.dart';
import 'package:finance_management/model/entity/saving_categories/saving_category_entity.dart';

class DetailSavingsState extends Equatable {
  final List<SavingCategoryEntity> savingCategories;

   const DetailSavingsState({ this.savingCategories = const []});

  DetailSavingsState copyWith({List<SavingCategoryEntity>? savingCategories}) {
    return DetailSavingsState(savingCategories: savingCategories ?? this.savingCategories);
  }

  // copy with
  @override
  List<Object?> get props => [savingCategories];
}
