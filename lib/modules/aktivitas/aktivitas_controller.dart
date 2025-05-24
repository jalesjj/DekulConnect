// aktivitas_controller.dart
import 'dart:developer';

import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AktivitasController extends BaseViewModel {
  final _schoolServices = Get.find<SchoolServices>();

  final aktivitas = Rx<List<Aktivitas>>([]);
  final metaAktivitas = Rx<MetaResponse?>(null);

  final aktivitasType = Rx<AktivitasTypeEnums?>(null);

  final selectedSiswa = Rx<Siswa?>(null);
  final selectedDate = Rx<DateTime>(DateTime.now());
  final listTanggal = Rx<int?>(null);
  final pageTanggal = Rx<int>(1);

  @override
  void onInit() {
    super.onInit();
    log("AktivitasController on Init");
    init();
  }

  Future<void> onSiswaChanged(Siswa? siswa) async {
    selectedSiswa.value = siswa;
    showLoadingContainer();
    await fetchAktivitasBySiswa();
    hideLoadingContainer();
  }

  void onDateChanged(DateTime dateTime) {
    selectedDate.value = dateTime;
    pageTanggal.value = 1;
    update();
  }

  void onPageChanged(int page) {
    pageTanggal.value = page;
    update();
  }

  Future<void> init() async {
    showLoadingContainer();
    aktivitasType.value = Get.arguments;
    if (Get.isRegistered<HomeController>()) {
      final homeController = Get.find<HomeController>();
      if (homeController.userRole.value == RoleEnums.guru) {
        selectedSiswa.value = homeController.siswas.value.firstOrNull;
      } else {
        selectedSiswa.value = homeController.siswa.value;
      }
    }
    await fetchAktivitasBySiswa();
    hideLoadingContainer();
  }

  Future<void> fetchAktivitasBySiswa() async {
    try {
      if (selectedSiswa.value == null) return;

      final year = selectedDate.value.year;
      final month = selectedDate.value.month;
      listTanggal.value = DateUtils.getDaysInMonth(year, month);

      // Debug log untuk memastikan tanggal yang digunakan
      final tanggalAwal = DateFormat("yyyy-MM-01").format(selectedDate.value);
      final tanggalAkhir = DateFormat("yyyy-MM-dd").format(DateTime(year, month, listTanggal.value ?? 1));
      log("Fetching aktivitas untuk range: $tanggalAwal sampai $tanggalAkhir");

      final result = await (aktivitasType.value == AktivitasTypeEnums.rumah
          ? _schoolServices.fetchAktivitasRumahBySiswa
          : _schoolServices.fetchAktivitasSekolahBySiswa)(
        (selectedSiswa.value?.id ?? 0).toString(),
        1,
        50,
        // PERBAIKAN: Gunakan range bulanan untuk menampilkan semua data
        tanggalAwal,   // 2025-05-01 (awal bulan)
        tanggalAkhir,  // 2025-05-31 (akhir bulan)
      );
      
      aktivitas.value = result.data ?? [];
      metaAktivitas.value = result.meta;
      
      log("Aktivitas ditemukan: ${aktivitas.value.length} items");
      update();
    } catch (e) {
      logger.e(e);
    }
  }
}