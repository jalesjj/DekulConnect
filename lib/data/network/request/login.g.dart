// lib/data/network/request/login.g.dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
  phone: json['phone'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'phone': instance.phone,
  'password': instance.password,
};
