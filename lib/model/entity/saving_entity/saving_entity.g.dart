// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavingEntity _$SavingEntityFromJson(Map<String, dynamic> json) => SavingEntity(
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
  categoryId: json['category_id'] as String?,
  targetAmount: (json['target_amount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SavingEntityToJson(SavingEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'target_amount': instance.targetAmount,
    };
