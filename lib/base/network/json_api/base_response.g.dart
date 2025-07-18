// lib/base/network/json_api/base_response.g.dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BaseResponse<T>(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

BaseListResponse<T> _$BaseListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BaseListResponse<T>(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  meta:
      json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BaseListResponseToJson<T>(
  BaseListResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data?.map(toJsonT).toList(),
  'meta': instance.meta,
};

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
  page: (json['page'] as num?)?.toInt(),
  take: (json['take'] as num?)?.toInt(),
  itemCount: (json['itemCount'] as num?)?.toInt(),
  pageCount: (json['pageCount'] as num?)?.toInt(),
  hasPreviousPage: json['hasPreviousPage'] as bool?,
  hasNextPage: json['hasNextPage'] as bool?,
);

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'take': instance.take,
      'itemCount': instance.itemCount,
      'pageCount': instance.pageCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };
