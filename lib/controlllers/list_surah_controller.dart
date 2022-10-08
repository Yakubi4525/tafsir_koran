import 'package:get/get.dart';
import 'package:tafsir/features/pray_time/data/datasources/pray_services.dart';
import 'package:tafsir/features/tafsir/data/datasources/list_surah_services.dart';
import 'package:tafsir/features/tafsir/domain/entities/list_surah.dart';


class ListSurahController extends GetxController {
  var listSurah = Future.value(ListSurah()).obs;



  @override
  void onInit() {
    super.onInit();
    getListSurah();
  }

  void getListSurah() async {
    listSurah.value = ListSurahServices.fetchSurah();
  }
}
