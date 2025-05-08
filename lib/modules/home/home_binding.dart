import 'package:get/get.dart';

import 'package:dekul_connect_app/modules/modules.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
