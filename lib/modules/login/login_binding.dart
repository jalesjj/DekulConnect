import 'package:get/get.dart';

import 'package:dekul_connect_app/modules/modules.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
