import 'package:get/get.dart';

import 'package:dekul_connect_app/modules/modules.dart';

class AktivitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AktivitasController>(() => AktivitasController(), fenix: true);
  }
}
