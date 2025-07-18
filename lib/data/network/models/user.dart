// lib/data/network/models/user.dart
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? role;
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
