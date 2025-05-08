import 'package:get/get.dart';

enum AktivitasRumahEnums {
  ibadah('ibadah'),
  sosial('sosial'),
  kemandirian('kemandirian');

  final String value;
  const AktivitasRumahEnums(this.value);

  static AktivitasRumahEnums? fromString(String key) {
    return AktivitasRumahEnums.values.firstWhereOrNull((e) => e.value == key);
  }
}

extension AktivitasRumahDetailExt on AktivitasRumahEnums {
  List<String> get indikator {
    switch (this) {
      case AktivitasRumahEnums.ibadah:
        return [
          'Salat Zuhur',
          'Salat Asar',
          'Salat Maghrib',
          'Salat Isya',
          'Salat Subuh',
          'Salat Duha',
          'Berdoa sesudah salat',
          'Membaca Jilid/Al-Qur\'an',
          'Berwudu menjelang tidur',
          'Berdoa ketika masuk dan keluar rumah',
        ];
      case AktivitasRumahEnums.sosial:
        return [
          'Salam dan berjabat tangan dengan orang tua',
          'Mematuhi perintah dan nasihat orang tua',
          'Sopan dan santun kepada orang tua',
          'Berperilaku sopan kepada semua orang',
          'Menyayangi kakak, adik, dan saudara lainnya',
        ];
      case AktivitasRumahEnums.kemandirian:
        return [
          'Bangun tidur sendiri',
          'Mandi dan gosok gigi sendiri',
          'Memakai dan melepas pakaian sendiri',
          'Memakai dan melepas sepatu sendiri',
          'Makan sendiri',
          'Menyiapkan buku peralatan sekolah sendiri',
          'Belajar',
          'Budaya membaca di rumah',
          'Menggosok gigi sebelum tidur',
          'Meletakkan peralatan sekolah di tempatnya',
          'Membantu pekerjaan di rumah',
        ];
    }
  }
}
