import 'package:get/get.dart';

import 'package:dekul_connect_app/modules/modules.dart';

class InputNilaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputNilaiController>(
      () => InputNilaiController(),
      fenix: true,
    );
  }
}
