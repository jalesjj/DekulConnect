import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:intl/intl.dart';

class InputAktivitasView extends BaseView<InputAktivitasController> {
  const InputAktivitasView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    final homeController = Get.find<HomeController>();
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
                "Input Aktivitas Di ${controller.aktivitasType.value?.value.capitalizeFirst}",
                style: BiryaniTextStyles.bold.copyWith(
                  fontSize: 22,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                homeController.selectedSiswa.value?.name ?? "-",
                style: BiryaniTextStyles.normal.copyWith(
                  fontSize: 14,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                DateFormat(
                  "d MMMM y",
                  "id",
                ).format(homeController.selectedDate.value),
                style: BiryaniTextStyles.normal.copyWith(
                  fontSize: 14,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              if (isRumah)
                ...AktivitasRumahEnums.values.map(
                  (e) => _inputRumahRender(aktivitasRumahEnums: e),
                )
              else
                ...AktivitasSekolahEnums.values.map(
                  (e) => _inputRumahRender(aktivitasSekolahEnums: e),
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
          child: ButtonRender(
            title: "Keluar",
            onTap: Get.back,
            backgroundColor: AppColors.aqua,
            borderColor: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _inputRumahRender({
    AktivitasRumahEnums? aktivitasRumahEnums,
    AktivitasSekolahEnums? aktivitasSekolahEnums,
  }) {
    final kategori =
        aktivitasRumahEnums != null
            ? aktivitasRumahEnums.value
            : aktivitasSekolahEnums?.value;
    final listAktivitas =
        aktivitasRumahEnums != null
            ? aktivitasRumahEnums.indikator
            : aktivitasSekolahEnums?.indikator ?? [];
    final filteredAktivitas =
        controller.aktivitas.value
            .where((r) => r.kategori == kategori)
            .toList();
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Text(
              kategori?.capitalizeFirst ?? "",
              style: BiryaniTextStyles.bold.copyWith(
                fontSize: 24,
                color: AppColors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              spacing: 12,
              children: List.generate(listAktivitas.length, (i) {
                final selectedAktivitas = filteredAktivitas.firstWhereOrNull(
                  (e) => e.aktivitas == listAktivitas[i],
                );
                return Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.green),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${i + 1}. ${listAktivitas[i]}",
                          style: BiryaniTextStyles.normal.copyWith(
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (selectedAktivitas?.checked != null) {
                            controller.performCheckedAktivitas(
                              selectedAktivitas ?? Aktivitas(),
                            );
                          } else {
                            controller.createAktivitas(
                              deskripsiAktivitas: listAktivitas[i],
                              aktivitasRumahEnums: aktivitasRumahEnums,
                              aktivitasSekolahEnums: aktivitasSekolahEnums,
                            );
                          }
                        },
                        child:
                            selectedAktivitas?.checked == 1
                                ? Assets.icons.icChecked.svg(
                                  width: 24,
                                  height: 24,
                                )
                                : Assets.icons.icUnchecked.svg(
                                  width: 24,
                                  height: 24,
                                ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
