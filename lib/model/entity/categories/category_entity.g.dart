// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) =>
    CategoryEntity(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      name: json['name'] as String?,
      type: $enumDecodeNullable(_$TypeTransactionEnumMap, json['type']),
    );

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'name': instance.name,
      'type': _$TypeTransactionEnumMap[instance.type],
    };

const _$TypeTransactionEnumMap = {
  TypeTransaction.income: 'income',
  TypeTransaction.expense: 'expense',
  TypeTransaction.saving: 'saving',
};
