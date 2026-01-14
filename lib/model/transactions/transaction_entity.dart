import 'package:finance_management/model/enum/type_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_entity.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionEntity {
  String? id;
  DateTime? createdAt;
  String? title;
  String? userId;
  String? categoryId;
  String? date;
  double? amount;
  String? note;
  TypeTransaction? type;
  TransactionEntity ({
    this.id,
    this.createdAt,
    this.userId,
    this.categoryId,
    this.date,
    this.amount,
    this.note,
    this.title,
    this.type
  });
  // copy with
  TransactionEntity copywith({
    String? id,
    DateTime? createdAt,
    String? title,
    String? userId,
    String? categoryId,
    String? date,
    double? amount,
    String? note,
    TypeTransaction? type

  }){
    return TransactionEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      type: type ?? this.type,

    );
  }

  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);

  factory TransactionEntity.fromJson(Map<String, dynamic> json) {
    if (json['type'] is String) {
      json['type'] = (json['type'] as String).trim();
    }
    return _$TransactionEntityFromJson(json);
  }

}
