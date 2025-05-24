import 'dart:developer';

import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:get/get.dart';

class NilaiController extends BaseViewModel {
  final _schoolServices = Get.find<SchoolServices>();

  final nilai = Rx<List<Nilai>>([]);
  final metaNilai = Rx<MetaResponse?>(null);

  final selectedSiswa = Rx<Siswa?>(null);

  @override
  void onInit() {
    super.onInit();
    log("NilaiController on Init");
    init();
  }

  Future<void> onSiswaChanged(Siswa? siswa) async {
    selectedSiswa.value = siswa;
    showLoadingContainer();
    await fetchNilaiBySiswa();
    hideLoadingContainer();
  }

  Future<void> init() async {
    showLoadingContainer();
    if (Get.isRegistered<HomeController>()) {
      final homeController = Get.find<HomeController>();
      if (homeController.userRole.value == RoleEnums.guru) {
        selectedSiswa.value = homeController.siswas.value.firstOrNull;
      } else {
        selectedSiswa.value = homeController.siswa.value;
      }
    }
    await fetchNilaiBySiswa();
    hideLoadingContainer();
  }

  Future<void> fetchNilaiBySiswa() async {
    try {
      if (selectedSiswa.value == null) return;
      final result = await _schoolServices.fetchNilaiBySiswa(
        (selectedSiswa.value?.id ?? 0).toString(),
        1,
        50,
      );
      nilai.value = result.data ?? [];
      metaNilai.value = result.meta;
      update();
    } catch (e) {
      logger.e(e);
    }
  }
}
