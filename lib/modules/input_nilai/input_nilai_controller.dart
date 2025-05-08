import 'dart:developer';

import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputNilaiController extends BaseViewModel {
  final _schoolServices = Get.find<SchoolServices>();

  final selectedSiswa = Rx<Siswa?>(null);
  final selectedDate = Rx<DateTime>(DateTime.now());

  final mapelTextController = TextEditingController();
  final nilaiTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    log("InputNilaiController on Init");
    if (Get.isRegistered<HomeController>()) {
      final homeController = Get.find<HomeController>();
      selectedSiswa.value = homeController.siswas.value.firstOrNull;
    }
  }

  void onSiswaChanged(Siswa? siswa) {
    selectedSiswa.value = siswa;
    update();
  }

  void onDateChanged(DateTime dateTime) {
    selectedDate.value = dateTime;
    update();
  }

  Future<void> performCreateNilai() async {
    showLoadingContainer();
    await createNilai();
    hideLoadingContainer();
  }

  Future<void> createNilai() async {
    try {
      if (mapelTextController.text.isEmpty) {
        await showAlertDialog(content: "Mohon isi mata pelajaran");
        return;
      }
      if (nilaiTextController.text.isEmpty) {
        await showAlertDialog(content: "Mohon isi nilai");
        return;
      }
      final result = await _schoolServices.createNilai(
        Nilai(
          siswaId: selectedSiswa.value?.id,
          tanggal: DateFormat("yyyy-MM-dd").format(selectedDate.value),
          mapel: mapelTextController.text,
          nilai: int.tryParse(nilaiTextController.text),
        ),
      );
      if (result.data != null) {
        final nilai = result.data;
        await showAlertDialog(
          title: "Informasi",
          content:
              "Nilai ${nilai?.nilai ?? 0} pada mapel ${nilai?.mapel ?? "-"} untuk siswa ${selectedSiswa.value?.name ?? "-"} Berhasil di input!",
        );
        Get.back();
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
