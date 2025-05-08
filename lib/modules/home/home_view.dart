import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/modules/modules.dart';
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:intl/intl.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return _getPage();
  }

  Widget _getPage() {
    switch (controller.selectedTab.value) {
      case 0:
        return _aktivitasRender();
      case 2:
        return _profileRender();
      default:
        return _homeRender();
    }
  }

  Widget _homeRender() {
    final title =
        controller.userRole.value == RoleEnums.guru
            ? "Selamat Datang di Dashboard Guru"
            : "Selamat Datang di Dashboard Orang Tua";
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(height: Get.mediaQuery.viewPadding.top),
        Text(
          title,
          style: BiryaniTextStyles.bold.copyWith(fontSize: 24),
          textAlign: TextAlign.left,
        ),
        _headerRender(),
        ButtonRender(
          title: "Lihat aktifitas di sekolah",
          onTap: () {
            Get.toNamed(
              Routes.AKTIVITAS,
              arguments: AktivitasTypeEnums.sekolah,
            );
          },
        ),
        const SizedBox(height: 12),
        ButtonRender(
          title: "Lihat aktifitas di rumah",
          onTap: () {
            Get.toNamed(Routes.AKTIVITAS, arguments: AktivitasTypeEnums.rumah);
          },
        ),
        const SizedBox(height: 12),
        ButtonRender(
          title: "Lihat nilai",
          onTap: () {
            Get.toNamed(Routes.NILAI);
          },
        ),
        if (controller.userRole.value == RoleEnums.guru)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ButtonRender(
              title: "Input nilai",
              onTap: () {
                Get.toNamed(Routes.INPUT_NILAI);
              },
            ),
          ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _headerRender() {
    return controller.userRole.value == RoleEnums.guru
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "VISI",
                    style: BiryaniTextStyles.bold.copyWith(fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ...List.generate(controller.visi.length, (index) {
                return Text(
                  '${index + 1}. ${controller.visi[index]}',
                  style: BiryaniTextStyles.normal.copyWith(fontSize: 11),
                  textAlign: TextAlign.left,
                );
              }),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MISI",
                    style: BiryaniTextStyles.bold.copyWith(fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ...List.generate(controller.misi.length, (index) {
                return Text(
                  '${index + 1}. ${controller.misi[index]}',
                  style: BiryaniTextStyles.normal.copyWith(fontSize: 11),
                  textAlign: TextAlign.left,
                );
              }),
            ],
          ),
        )
        : Assets.images.anakAnak.image();
  }

  Widget _profileRender() {
    final isGuru = controller.userRole.value == RoleEnums.guru;
    final title = isGuru ? "Profile Guru" : "Profile Murid";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: Get.mediaQuery.viewPadding.top),
          Text(
            title,
            style: BiryaniTextStyles.bold.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadiuses.circular12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 36, backgroundColor: AppColors.blue),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isGuru
                          ? (controller.user.value?.name ?? "Tidak Ada Nama")
                          : (controller.siswa.value?.name ?? "Tidak Ada Siswa"),
                      style: BiryaniTextStyles.bold.copyWith(fontSize: 18),
                    ),
                    if (!isGuru)
                      Text(
                        "Kelas ${controller.siswa.value?.kelas ?? "-"}",
                        style: BiryaniTextStyles.bold.copyWith(fontSize: 12),
                      ),
                    Text(
                      (isGuru
                              ? controller.user.value?.phone
                              : controller.siswa.value?.phone) ??
                          "-",
                      style: BiryaniTextStyles.normal.copyWith(fontSize: 12),
                    ),
                    Text(
                      (isGuru
                              ? controller.user.value?.address
                              : controller.siswa.value?.address) ??
                          "-",

                      style: BiryaniTextStyles.bold.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 120,
                child: ButtonRender(
                  title: "Keluar",
                  onTap: controller.performLogout,
                  icon: Assets.icons.icKeluar.svg(),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _aktivitasRender() {
    final isGuru = controller.userRole.value == RoleEnums.guru;
    final title = isGuru ? "Sekolah" : "Rumah";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.mediaQuery.viewPadding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Aktivitas Di $title",
                style: BiryaniTextStyles.bold.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 24),
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
                          controller.siswas.value.map((value) {
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
            "Tanggal Terpilih",
            style: BiryaniTextStyles.normal.copyWith(fontSize: 12),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 4),
          Text(
            DateFormat("d MMMM y", "id").format(controller.selectedDate.value),
            style: BiryaniTextStyles.bold.copyWith(fontSize: 16),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 24),
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
          SizedBox(height: 24),
          Spacer(),
          ButtonRender(
            title: "Masukan Aktivitas",
            onTap: () {
              Get.toNamed(
                Routes.INPUT_AKTIVITAS,
                arguments:
                    isGuru
                        ? AktivitasTypeEnums.sekolah
                        : AktivitasTypeEnums.rumah,
              );
            },
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return Obx(() {
      return BottomNavigationBar(
        onTap: controller.onTabChanged,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon:
                (controller.selectedTab.value == 0
                        ? Assets.icons.icRapot
                        : Assets.icons.icRapotGrey)
                    .svg(),
          ),
          BottomNavigationBarItem(
            label: "",
            icon:
                (controller.selectedTab.value == 1
                        ? Assets.icons.icHome
                        : Assets.icons.icHomeGrey)
                    .svg(),
          ),
          BottomNavigationBarItem(
            label: "",
            icon:
                (controller.selectedTab.value == 2
                        ? Assets.icons.icProfile
                        : Assets.icons.icProfileGrey)
                    .svg(),
          ),
        ],
      );
    });
  }
}
