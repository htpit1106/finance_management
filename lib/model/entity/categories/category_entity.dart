import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryEntity {
  String? id;
  DateTime? createdAt;
  String? name;
  TypeTransaction? type;


  CategoryEntity({this.id, this.createdAt, this.name, this.type});
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);
}
