// aktivitas_view.dart
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:intl/intl.dart';

class AktivitasView extends BaseView<AktivitasController> {
  const AktivitasView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final isGuru = homeController.userRole.value == RoleEnums.guru;
    final isRumah = controller.aktivitasType.value == AktivitasTypeEnums.rumah;
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(height: Get.mediaQuery.viewPadding.top),
              Text(
                "Hasil Aktivitas ${controller.aktivitasType.value?.value.capitalizeFirst}",
                style: BiryaniTextStyles.bold.copyWith(
                  fontSize: 22,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 36),
              Row(
                children: [
                  Text(
                    "Nama Siswa:${isGuru ? "" : (" ${controller.selectedSiswa.value?.name ?? "-"}")}",
                    style: BiryaniTextStyles.bold.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  if (isGuru) ...[
                    SizedBox(width: 6),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: DropdownButton<Siswa>(
                          value: controller.selectedSiswa.value,
                          hint: Text(
                            "Pilih salah satu siswa",
                            style: BiryaniTextStyles.normal.copyWith(
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          ),
                          isExpanded: true,
                          items: homeController.siswas.value.map((value) {
                            return DropdownMenuItem<Siswa>(
                              value: value,
                              child: Text(
                                value.name ?? "",
                                style: BiryaniTextStyles.normal.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: controller.onSiswaChanged,
                          underline: SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (isRumah)
                ...AktivitasRumahEnums.values.map(
                  (e) => _aktivitasDateRender(aktivitasRumahEnums: e),
                )
              else
                ...AktivitasSekolahEnums.values.map(
                  (e) => _aktivitasDateRender(aktivitasSekolahEnums: e),
                ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            context.mediaQueryViewPadding.bottom,
          ),
          child: ButtonRender(title: "Keluar", onTap: Get.back),
        ),
      ],
    );
  }

  Widget _aktivitasDateRender({
    AktivitasRumahEnums? aktivitasRumahEnums,
    AktivitasSekolahEnums? aktivitasSekolahEnums,
  }) {
    final kategori = aktivitasRumahEnums != null
        ? aktivitasRumahEnums.value
        : aktivitasSekolahEnums?.value;
    final listAktivitas = aktivitasRumahEnums != null
        ? aktivitasRumahEnums.indikator
        : aktivitasSekolahEnums?.indikator ?? [];

    final filteredAktivitas = controller.aktivitas.value
        .where((r) => r.kategori == kategori)
        .toList();

    final listTanggal = List.generate(
      controller.listTanggal.value ?? 0,
      (i) => i + 1,
    );

    final page = controller.pageTanggal.value;
    final startIndex = (page - 1) * 11;
    final endIndex = startIndex + 11;

    bool hasPrevious = (page > 1);
    bool hasNext = (page < (listTanggal.length / 11).ceil());

    final filteredTanggal = listTanggal
        .getRange(startIndex, endIndex.clamp(0, listTanggal.length))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                kategori?.capitalizeFirst ?? "",
                style: BiryaniTextStyles.bold.copyWith(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: controller.selectedDate.value,
                      minimumDate: DateTime(2024),
                      maximumDate: DateTime.now().add(Duration(days: 1)),
                      mode: CupertinoDatePickerMode.monthYear,
                      onDateTimeChanged: controller.onDateChanged,
                    ),
                  );
                  controller.init();
                },
                child: Text(
                  "Bulan: ${DateFormat("MMMM y", "id").format(controller.selectedDate.value)}",
                  style: BiryaniTextStyles.bold.copyWith(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Table(
            defaultColumnWidth: FixedColumnWidth(28),
            children: [
              TableRow(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (hasPrevious) {
                        controller.onPageChanged(page - 1);
                      }
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: hasPrevious ? AppColors.black : AppColors.aqua,
                    ),
                  ),
                  for (int i = 0; i < 11; i++)
                    (filteredTanggal.length <= i)
                        ? SizedBox.shrink()
                        : Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                '${filteredTanggal[i]}',
                                style: BiryaniTextStyles.normal.copyWith(
                                  fontSize: 13,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                  GestureDetector(
                    onTap: () {
                      if (hasNext) {
                        controller.onPageChanged(page + 1);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: hasNext ? AppColors.black : AppColors.aqua,
                    ),
                  ),
                ],
              ),
              for (int row = 0; row < listAktivitas.length; row++)
                TableRow(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          '${row + 1}',
                          style: BiryaniTextStyles.normal.copyWith(
                            fontSize: 13,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    for (int col = 0; col < 11; col++)
                      (filteredTanggal.length <= col)
                          ? SizedBox.shrink()
                          : Center(
                              child: _buildActivityIcon(
                                filteredAktivitas,
                                listAktivitas[row],
                                filteredTanggal[col],
                              ),
                            ),
                    SizedBox.shrink(),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method untuk build icon aktivitas dengan logic yang diperbaiki
  Widget _buildActivityIcon(
    List<Aktivitas> filteredAktivitas,
    String aktivitasName,
    int tanggal,
  ) {
    // Format tanggal yang akan dibandingkan
    final targetDateString = DateFormat("yyyy-MM-${tanggal.toString().padLeft(2, '0')}")
        .format(controller.selectedDate.value);
    
    // Cari aktivitas yang match
    final matchingActivity = filteredAktivitas.firstWhereOrNull((e) {
      // Perbaikan 1: Handle both bool dan int untuk checked
      final isChecked = (e.checked == 1) || (e.checked == true);
      
      // Perbaikan 2: Parse tanggal dari API response untuk perbandingan
      String apiDateString = '';
      if (e.tanggal != null) {
        try {
          // Parse ISO format dari API
          final parsedDate = DateTime.parse(e.tanggal!);
          apiDateString = DateFormat("yyyy-MM-dd").format(parsedDate);
        } catch (err) {
          // Fallback jika parsing gagal
          apiDateString = e.tanggal!.split('T')[0]; // Ambil bagian tanggal saja
        }
      }
      
      return e.aktivitas == aktivitasName &&
             isChecked &&
             apiDateString == targetDateString;
    });
    
    return matchingActivity != null 
        ? Icon(Icons.done_rounded, size: 20)
        : SizedBox.shrink();
  }

  Future<void> _showDialog(Widget child) async {
    await showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(top: false, child: child),
      ),
    );
  }
}