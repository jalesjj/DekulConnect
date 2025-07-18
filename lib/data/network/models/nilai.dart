// lib/data/network/models/nilai.dart
import 'package:json_annotation/json_annotation.dart';

part 'nilai.g.dart';

@JsonSerializable()
class Nilai {
  @JsonKey(includeIfNull: false)
  int? id;
  @JsonKey(name: 'siswa_id')
  int? siswaId;
  String? tanggal;
  String? mapel;
  int? nilai;
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  String? updatedAt;

  Nilai({
    this.id,
    this.siswaId,
    this.tanggal,
    this.mapel,
    this.nilai,
    this.createdAt,
    this.updatedAt,
  });

  // Konversi dari JSON response ke object Nilai
  factory Nilai.fromJson(Map<String, dynamic> json) => _$NilaiFromJson(json);
   // Konversi dari object Nilai ke JSON untuk request body
  Map<String, dynamic> toJson() => _$NilaiToJson(this);
}
