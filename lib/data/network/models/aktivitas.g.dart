// lib/data/network/models/aktivitas.g.dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aktivitas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aktivitas _$AktivitasFromJson(Map<String, dynamic> json) => Aktivitas(
  id: (json['id'] as num?)?.toInt(),
  siswaId: (json['siswa_id'] as num?)?.toInt(),
  tanggal: json['tanggal'] as String?,
  kategori: json['kategori'] as String?,
  aktivitas: json['aktivitas'] as String?,
  checked: Aktivitas._checkedFromJson(json['checked']),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

// CONTOH JSON YANG DIKIRIM KE API ; api inak
Map<String, dynamic> _$AktivitasToJson(Aktivitas instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,     // null saat create
  'siswa_id': instance.siswaId,                          // contoh: 1
  'tanggal': instance.tanggal,                           // contoh: "2025-05-26"
  'kategori': instance.kategori,                         // contoh: "ibadah"
  'aktivitas': instance.aktivitas,                       // contoh: "Salat Zuhur"
  'checked': Aktivitas._checkedToJson(instance.checked), // contoh: 1
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.updatedAt case final value?) 'updated_at': value,
};
