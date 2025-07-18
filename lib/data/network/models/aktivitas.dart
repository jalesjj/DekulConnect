// lib/data/network/models/aktivitas.dart
import 'package:json_annotation/json_annotation.dart';

part 'aktivitas.g.dart';

@JsonSerializable()
class Aktivitas {
  @JsonKey(includeIfNull: false)
  int? id;
  @JsonKey(name: 'siswa_id')
  int? siswaId;       // ID siswa  ;;      
  String? tanggal;    // Format: "2025-05-26"
  String? kategori;   // "ibadah", "sosial", dll
  String? aktivitas;  // "Salat Zuhur", "Bangun tidur sendiri", dll
  
  // Custom converter untuk menangani boolean dari API
  @JsonKey(fromJson: _checkedFromJson, toJson: _checkedToJson)
  int? checked;       // 1 = checked, 0 = unchecked
  
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  String? updatedAt;

  Aktivitas({
    this.id,
    this.siswaId,
    this.tanggal,
    this.kategori,
    this.aktivitas,
    this.checked,
    this.createdAt,
    this.updatedAt,
  });

  // Static method untuk konversi dari JSON (menangani bool dan int)
  static int? _checkedFromJson(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value ? 1 : 0;
    if (value is num) return value.toInt();
    return null;
  }

  // Static method untuk konversi ke JSON (tetap kirim sebagai int)
  static int? _checkedToJson(int? value) => value;

  // Factory untuk parsing dari JSON response
  factory Aktivitas.fromJson(Map<String, dynamic> json) =>
      _$AktivitasFromJson(json);

  // KONVERSI KE JSON UNTUK API REQUEST ; api inak
  Map<String, dynamic> toJson() => _$AktivitasToJson(this);

  Aktivitas copyWith({
    int? id,
    int? siswaId,
    String? tanggal,
    String? kategori,
    String? aktivitas,
    int? checked,
    String? createdAt,
    String? updatedAt,
  }) {
    return Aktivitas(
      id: id ?? this.id,
      siswaId: siswaId ?? this.siswaId,
      tanggal: tanggal ?? this.tanggal,
      kategori: kategori ?? this.kategori,
      aktivitas: aktivitas ?? this.aktivitas,
      checked: checked ?? this.checked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}