// lib/base/network/response/error_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  String? message;

  ErrorResponse({this.message});

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
