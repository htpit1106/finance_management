import 'package:equatable/equatable.dart';
import 'package:finance_management/model/entity/categories/category_entity.dart';

class CategoryState extends Equatable {
  final List<CategoryEntity> categories;
  final CategoryEntity selectedCategory;

  const CategoryState({required this.categories, required this.selectedCategory});

  CategoryState copyWith({List<CategoryEntity>? categories, CategoryEntity? selectedCategory}) {
    return CategoryState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [categories, selectedCategory];
}
