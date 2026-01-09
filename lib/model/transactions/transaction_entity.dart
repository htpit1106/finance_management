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

  TransactionEntity ({
    this.id,
    this.createdAt,
    this.userId,
    this.categoryId,
    this.date,
    this.amount,
    this.note,
    this.title
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

    );
  }

  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);

  factory TransactionEntity.fromJson(Map<String, dynamic> json) => _$TransactionEntityFromJson(json);

}