import 'package:get/get.dart';
import 'package:tafsir/features/tafsir/data/datasources/services/specific_surah_services.dart';
import 'package:tafsir/features/tafsir/domain/entities/specific_surah.dart';

// import 'package:simple_quran_apps/views/detail_surah/detail_surah.dart';

class SpecificSurahController extends GetxController {
  static var _specificSurah = Future.value(SpecificSurah()).obs;
  Future<SpecificSurah> get specifSurah => _specificSurah.value;

  setPage(String page) {
    var services = SpecificSurahServices.fetchSurah(page);
    _specificSurah.value = services;
  }
}
