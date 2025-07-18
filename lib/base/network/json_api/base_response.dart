// lib/base/network/json_api/base_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  String? status;
  String? message;
  T? data;

  BaseResponse({this.status, this.message, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> {
  String? status;
  String? message;
  List<T>? data;
  MetaResponse? meta;

  BaseListResponse({this.status, this.message, this.data, this.meta}) : super();

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) =>
      _$BaseListResponseToJson(this, toJsonT);
}

@JsonSerializable()
class MetaResponse {
  int? page;
  int? take;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  MetaResponse({
    this.page,
    this.take,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}
