
import 'package:json_annotation/json_annotation.dart';

part 'saving_category_entity.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class SavingCategoryEntity {
  String? id;
  String? name;
  DateTime? createdAt;
  String? userId;
  String? icPath;
  DateTime? date;
  double targetAmount;
  double currentAmount;

  SavingCategoryEntity({
    this.id,
    this.name,
    this.createdAt,
    this.userId,
    this.icPath,
    this.date,
    this.targetAmount = 0,
    this.currentAmount = 0,
  });
  Map<String, dynamic> toJson() => _$SavingCategoryEntityToJson(this);
  factory SavingCategoryEntity.fromJson(Map<String, dynamic> json) => _$SavingCategoryEntityFromJson(json);




}