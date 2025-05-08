import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:intl/intl.dart';

class InputNilaiView extends BaseView<InputNilaiController> {
  const InputNilaiView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(height: Get.mediaQuery.viewPadding.top),
              Text(
                "Input Nilai",
                style: BiryaniTextStyles.bold.copyWith(
                  fontSize: 22,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36),
              Row(
                children: [
                  Text(
                    "Nama Siswa:",
                    style: BiryaniTextStyles.bold.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  ...[
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
              SizedBox(height: 12),
              Text(
                "Mata Pelajaran",
                style: BiryaniTextStyles.normal.copyWith(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4),
              BaseTextField(
                hintText: "Masukan Mata Pelajaran",
                controller: controller.mapelTextController,
              ),
              SizedBox(height: 12),
              Text(
                "Nilai",
                style: BiryaniTextStyles.normal.copyWith(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4),
              BaseTextField(
                hintText: "Masukan Nilai",
                controller: controller.nilaiTextController,
                inputType: TextInputType.number,
              ),
              SizedBox(height: 12),
              Text(
                "Tanggal Terpilih",
                style: BiryaniTextStyles.normal.copyWith(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4),
              Text(
                DateFormat(
                  "d MMMM y",
                  "id",
                ).format(controller.selectedDate.value),
                style: BiryaniTextStyles.bold.copyWith(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.aqua,
                  borderRadius: BorderRadiuses.circular24,
                ),
                child: CalendarDatePicker(
                  initialDate: controller.selectedDate.value,
                  firstDate: DateTime(2024),
                  lastDate: DateTime.now().add(Duration(days: 1)),
                  onDateChanged: controller.onDateChanged,
                ),
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
          child: Row(
            children: [
              Expanded(
                child: ButtonRender(
                  title: "Keluar",
                  onTap: Get.back,
                  backgroundColor: AppColors.aqua,
                  borderColor: AppColors.black,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ButtonRender(
                  title: "Input",
                  onTap: controller.performCreateNilai,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
