// lib/data/enums/role_enums.dart
import 'package:get/get.dart';

enum RoleEnums {
  guru('guru'),
  ortu('ortu');

  final String value;
  const RoleEnums(this.value);

  static RoleEnums? fromString(String key) {
    return RoleEnums.values.firstWhereOrNull((e) => e.value == key);
  }
}
