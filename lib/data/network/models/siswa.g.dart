// lib/data/network/models/siswa.g.dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siswa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Siswa _$SiswaFromJson(Map<String, dynamic> json) => Siswa(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  kelas: json['kelas'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  ortuId: (json['ortu_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$SiswaToJson(Siswa instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'kelas': instance.kelas,
  'address': instance.address,
  'phone': instance.phone,
  'ortu_id': instance.ortuId,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};
