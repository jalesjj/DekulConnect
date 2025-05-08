import 'package:get/get.dart';

import 'package:dekul_connect_app/modules/modules.dart';

class InputAktivitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputAktivitasController>(
      () => InputAktivitasController(),
      fenix: true,
    );
  }
}
