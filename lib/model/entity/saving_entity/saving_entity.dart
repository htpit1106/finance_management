import 'package:json_annotation/json_annotation.dart';

part 'saving_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SavingEntity {
  String? id;
  String? userId;
  String? categoryId;
  double? targetAmount;

  SavingEntity({this.id, this.userId, this.categoryId, this.targetAmount});

  factory SavingEntity.fromJson(Map<String, dynamic> json) => _$SavingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SavingEntityToJson(this);
}
