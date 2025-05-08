import 'dart:developer';

import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputAktivitasController extends BaseViewModel {
  final _schoolServices = Get.find<SchoolServices>();

  final aktivitas = Rx<List<Aktivitas>>([]);
  final metaAktivitas = Rx<MetaResponse?>(null);

  final aktivitasType = Rx<AktivitasTypeEnums?>(null);

  final selectedSiswa = Rx<Siswa?>(null);
  final selectedDate = Rx<DateTime>(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    log("InputAktivitasController on Init");
    init();
  }

  Future<void> init() async {
    showLoadingContainer();
    if (Get.isRegistered<HomeController>()) {
      final homeController = Get.find<HomeController>();
      selectedSiswa.value = homeController.selectedSiswa.value;
      selectedDate.value = homeController.selectedDate.value;
    }
    aktivitasType.value = Get.arguments;
    await fetchAktivitasBySiswa();
    hideLoadingContainer();
  }

  Future<void> fetchAktivitasBySiswa() async {
    try {
      final result = await (aktivitasType.value == AktivitasTypeEnums.rumah
          ? _schoolServices.fetchAktivitasRumahBySiswa
          : _schoolServices.fetchAktivitasSekolahBySiswa)(
        (selectedSiswa.value?.id ?? 0).toString(),
        1,
        50,
        DateFormat("yyyy-MM-dd").format(selectedDate.value),
        DateFormat("yyyy-MM-dd").format(selectedDate.value),
      );
      aktivitas.value = result.data ?? [];
      metaAktivitas.value = result.meta;
      update();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> performCreateAktivitas({
    required String deskripsiAktivitas,
    AktivitasRumahEnums? aktivitasRumahEnums,
    AktivitasSekolahEnums? aktivitasSekolahEnums,
  }) async {
    showLoadingContainer();
    await createAktivitas(
      deskripsiAktivitas: deskripsiAktivitas,
      aktivitasRumahEnums: aktivitasRumahEnums,
      aktivitasSekolahEnums: aktivitasSekolahEnums,
    );
    hideLoadingContainer();
  }

  Future<void> createAktivitas({
    required String deskripsiAktivitas,
    AktivitasRumahEnums? aktivitasRumahEnums,
    AktivitasSekolahEnums? aktivitasSekolahEnums,
  }) async {
    try {
      final kategori =
          aktivitasRumahEnums != null
              ? aktivitasRumahEnums.value
              : aktivitasSekolahEnums?.value;
      final result = await (aktivitasType.value == AktivitasTypeEnums.rumah
          ? _schoolServices.createAktivitasRumah
          : _schoolServices.createAktivitasSekolah)(
        Aktivitas(
          siswaId: selectedSiswa.value?.id,
          tanggal: DateFormat("yyyy-MM-dd").format(selectedDate.value),
          kategori: kategori,
          aktivitas: deskripsiAktivitas,
          checked: 1,
        ),
      ); 
      if (result.data != null) {
        init();
        
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> performCheckedAktivitas(Aktivitas aktivitas) async {
    showLoadingContainer();
    await checkedAktivitas(aktivitas);
    hideLoadingContainer();
  }

  Future<void> checkedAktivitas(Aktivitas aktivitas) async {
    try {
      final result = await (aktivitasType.value == AktivitasTypeEnums.rumah
          ? _schoolServices.updateAktivitasRumah
          : _schoolServices.updateAktivitasSekolah)(
        (aktivitas.id ?? 0).toString(),
        aktivitas.copyWith(checked: aktivitas.checked == 1 ? 0 : 1),
      );
      if (result.data != null) {
        init();
        
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
