// lib/data/network/request/login.dart
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';
// request login data yang dikirim API dan diiterima di models/authentication.dart
@JsonSerializable()
class Login {
  String? phone;
  String? password;

  Login({this.phone, this.password});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
