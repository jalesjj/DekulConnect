import 'package:get/get.dart';

import 'package:dekul_connect_app/modules/modules.dart';

class NilaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NilaiController>(() => NilaiController(), fenix: true);
  }
}
