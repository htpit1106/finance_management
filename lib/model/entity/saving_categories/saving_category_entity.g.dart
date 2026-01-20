// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavingCategoryEntity _$SavingCategoryEntityFromJson(
  Map<String, dynamic> json,
) => SavingCategoryEntity(
  id: json['id'] as String?,
  name: json['name'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  userId: json['user_id'] as String?,
  icPath: json['ic_path'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  targetAmount: (json['target_amount'] as num?)?.toDouble() ?? 0,
  currentAmount: (json['current_amount'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$SavingCategoryEntityToJson(
  SavingCategoryEntity instance,
) {
  final result = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'created_at': instance.createdAt?.toIso8601String(),
    'user_id': instance.userId,
    'ic_path': instance.icPath,
    'date': instance.date?.toIso8601String(),
    'target_amount': instance.targetAmount,
    'current_amount': instance.currentAmount,
  };
  result.removeWhere((k, v) => v == null);
  return result;
}
