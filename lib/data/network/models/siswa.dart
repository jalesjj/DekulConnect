// lib/data/network/models/siswa.dart
import 'package:json_annotation/json_annotation.dart';

part 'siswa.g.dart';

@JsonSerializable()
class Siswa {
  int? id;
  String? name;
  String? kelas;
  String? address;
  String? phone;
  @JsonKey(name: 'ortu_id')
  int? ortuId;
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  String? updatedAt;

  Siswa({
    this.id,
    this.name,
    this.kelas,
    this.address,
    this.phone,
    this.ortuId,
    this.createdAt,
    this.updatedAt,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => _$SiswaFromJson(json);
  Map<String, dynamic> toJson() => _$SiswaToJson(this);
}
