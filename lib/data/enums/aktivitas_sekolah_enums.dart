import 'package:get/get.dart';

enum AktivitasSekolahEnums {
  workship('workship'),
  sosial('sosial'),
  responsibility('responsibility');

  final String value;
  const AktivitasSekolahEnums(this.value);

  static AktivitasSekolahEnums? fromString(String key) {
    return AktivitasSekolahEnums.values.firstWhereOrNull((e) => e.value == key);
  }
}

extension AktivitasSekolahDetailExt on AktivitasSekolahEnums {
  List<String> get indikator {
    switch (this) {
      case AktivitasSekolahEnums.workship:
        return ['Prayer on time', 'Prayer orderly', 'Praying after prayer'];
      case AktivitasSekolahEnums.sosial:
        return [
          'Greetings and hand shaking to teachers and friends',
          'Being able to associate well',
          'Obeying to the teachers',
          'Being polite to everyone',
          'Not interrupting a conversation',
        ];
      case AktivitasSekolahEnums.responsibility:
        return [
          'Coming in the classroom on time',
          'Tidying uniform and school equipment',
          'Uniform and school equipment completely',
          'Focusing in the class',
          'Active in learning',
          'Completing the task on time',
          'Keeping the school cleaning',
          'Implementing eating manners',
        ];
    }
  }
}
