import 'package:json_annotation/json_annotation.dart';
part 'category_summary_entity.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class CategorySummaryEntity {
  String? categoryId;
  String? categoryName;
  double? totalAmount;
  CategorySummaryEntity({
    this.categoryId,
    this.categoryName,
    this.totalAmount
});

  Map<String, dynamic> toJson() => _$CategorySummaryEntityToJson(this);

  factory CategorySummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategorySummaryEntityFromJson(json);
}


