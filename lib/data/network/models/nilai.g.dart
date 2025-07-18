// lib/data/network/models/nilai.g.dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nilai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nilai _$NilaiFromJson(Map<String, dynamic> json) => Nilai(
  id: (json['id'] as num?)?.toInt(),
  siswaId: (json['siswa_id'] as num?)?.toInt(),
  tanggal: json['tanggal'] as String?,
  mapel: json['mapel'] as String?,
  nilai: (json['nilai'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$NilaiToJson(Nilai instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  'siswa_id': instance.siswaId,
  'tanggal': instance.tanggal,
  'mapel': instance.mapel,
  'nilai': instance.nilai,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};
