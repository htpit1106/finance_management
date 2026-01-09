// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) => TransactionEntity(
  id: json['id'] as String?,
  createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
  userId: json['user_id'] as String?,
  categoryId: json['category_id'] as String?,
  date: json['date'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  note: json['note'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$TransactionEntityToJson(TransactionEntity instance) {
  final result = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt?.toIso8601String(),
    'user_id': instance.userId,
    'category_id': instance.categoryId,
    'date': instance.date,
    'amount': instance.amount,
    'note': instance.note,
    'title': instance.title,
  };
  result.removeWhere((k, v) => v == null);
  return result;
}
