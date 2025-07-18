// lib/data/enums/aktivitas_type_enums.dart
import 'package:get/get.dart';

enum AktivitasTypeEnums {
  rumah('rumah'),
  sekolah('sekolah');

  final String value;
  const AktivitasTypeEnums(this.value);

  static AktivitasTypeEnums? fromString(String key) {
    return AktivitasTypeEnums.values.firstWhereOrNull((e) => e.value == key);
  }
}
