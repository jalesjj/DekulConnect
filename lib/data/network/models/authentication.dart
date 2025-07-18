// lib/data/network/models/authentication.dart
import 'package:dekul_connect_app/data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable()
class Authentication {
  User? user;
  String? token;

  Authentication({this.user, this.token});

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}
