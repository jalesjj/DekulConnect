import 'dart:developer';

import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/resources/resources.dart';
import 'package:get/get.dart';

class HomeController extends BaseViewModel {
  final _authenticationServices = Get.find<AuthenticationServices>();
  final _schoolServices = Get.find<SchoolServices>();
  final user = Rx<User?>(null);
  final userRole = Rx<RoleEnums?>(null);

  final siswas = Rx<List<Siswa>>([]);
  final metaSiswas = Rx<MetaResponse?>(null);
  final selectedSiswa = Rx<Siswa?>(null);

  final siswa = Rx<Siswa?>(null);

  final selectedTab = Rx<int>(1);
  final selectedDate = Rx<DateTime>(DateTime.now());

  final List<String> visi = [
    'Membangun generasi cerdas, aktif dan berprestasi.',
    'Membentuk generasi bangsa yang berbudi luhur.',
    'Membangun pendidikan yang maju dan berkelas Internasional.',
    'Menjadi panutan dalam prestasi, pendidikan dan moral.',
    'Menjadi pelopor sekolah berkonsep lingkungan yang mendukung adiwiyata.',
    'Menjadi lembaga pendidikan yang berdedikasi dalam mendidik generasi bangsa agar tumbuh berkualitas, bertakwa dan menjunjung tinggi adab.',
    'Mewujudkan individu berkelas yang bebas narkoba, berorientasi dan cerdas.',
  ];

  final List<String> misi = [
    'Memasukkan mata pelajaran pendidikan lingkungan hidup di sekolah dan membangun sarana dan prasarana kebersihan yang memadai.',
    'Menyediakan beragam ekstrakurikuler untuk mengembangkan bakat dan prestasi siswa-siswi.',
    'Menyiapkan tenaga pendidik yang profesional dan berkualitas untuk proses belajar mengajar di sekolah.',
  ];

  @override
  void onInit() {
    super.onInit();
    log("HomeController on Init");
    init();
  }

  void onTabChanged(int tab) {
    selectedTab.value = tab;
    update();
  }

  void onDateChanged(DateTime dateTime) {
    selectedDate.value = dateTime;
    update();
  }

  void onSiswaChanged(Siswa? siswa) {
    selectedSiswa.value = siswa;
    update();
  }

  Future<void> init() async {
    showLoadingContainer();
    await fetchUser();
    if (userRole.value == RoleEnums.guru) {
      await fetchSiswas();
    }
    hideLoadingContainer();
  }

  Future<void> fetchUser() async {
    try {
      final result = await _authenticationServices.me();
      user.value = result.data;
      userRole.value = RoleEnums.fromString(user.value?.role ?? "");
      if (userRole.value == RoleEnums.ortu) {
        await fetchSiswa();
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchSiswas() async {
    try {
      final result = await _schoolServices.fetchSiswa(1, 50);
      siswas.value = result.data ?? [];
      metaSiswas.value = result.meta;
      selectedSiswa.value = result.data?.firstOrNull;
      update();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchSiswa() async {
    try {
      final result = await _schoolServices.fetchSiswaByOrtu(
        user.value?.id.toString() ?? "",
        1,
        1,
      );
      siswa.value = result.data?.firstOrNull;
      selectedSiswa.value = result.data?.firstOrNull;
      update();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> performLogout() async {
    showLoadingContainer();
    await logout();
    hideLoadingContainer();
  }

  Future<void> logout() async {
    try {
      await _authenticationServices.logout();
      await SharedPrefs.remove(SessionConstant.token);
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      logger.e(e);
    }
  }
}
