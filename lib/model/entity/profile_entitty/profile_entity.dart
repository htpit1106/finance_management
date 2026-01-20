import 'package:json_annotation/json_annotation.dart';
part 'profile_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileEntity {
  int? id;
  DateTime? createdAt;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? avatarUrl;
  String? gender;
  String? userId;

  ProfileEntity({
    this.id,
    this.createdAt,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.avatarUrl,
    this.gender,
    this.userId,
  });

  // toJson
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);

  // fromJson
  factory ProfileEntity.fromJson(Map<String, dynamic> json) => _$ProfileEntityFromJson(json);
}
