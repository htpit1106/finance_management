// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorySummaryEntity _$CategorySummaryEntityFromJson(
  Map<String, dynamic> json,
) => CategorySummaryEntity(
  categoryId: json['category_id'] as String?,
  categoryName: json['category_name'] as String?,
  totalAmount: (json['total_amount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CategorySummaryEntityToJson(
  CategorySummaryEntity instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'total_amount': instance.totalAmount,
};
