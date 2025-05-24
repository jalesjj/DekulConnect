import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:intl/intl.dart';

class NilaiView extends BaseView<NilaiController> {
  const NilaiView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final isGuru = homeController.userRole.value == RoleEnums.guru;
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(height: Get.mediaQuery.viewPadding.top),
              Text(
                "Nilai Siswa",
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
                          items:
                              homeController.siswas.value.map((value) {
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
              SizedBox(height: 24),
              ...controller.nilai.value.map((e) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.darkBlue),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          DateFormat("d MMMM y", "id").format(
                            DateTime.tryParse(e.tanggal ?? "") ??
                                DateTime.now(),
                          ),
                          style: BiryaniTextStyles.bold.copyWith(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          (e.nilai ?? 0).toString(),
                          style: BiryaniTextStyles.bold.copyWith(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Text(
                          e.mapel ?? "",
                          style: BiryaniTextStyles.bold.copyWith(
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
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
}
