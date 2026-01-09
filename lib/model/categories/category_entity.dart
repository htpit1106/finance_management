import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryEntity {
  String? id;
  DateTime? createdAt;
  String? name;

  CategoryEntity ({
    this.id,
    this.createdAt,
    this.name,
  });
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);




}