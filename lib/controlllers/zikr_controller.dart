import 'package:get/get.dart';
import 'package:tafsir/features/tafsir/data/datasources/list_surah_services.dart';
import 'package:tafsir/features/zikr/data/datasources/zikr_service.dart';
import 'package:tafsir/features/zikr/domain/entities/zikr.dart';


class ZikrController extends GetxController {
  final String name;
  ZikrService zikrService=ZikrService();
  var listZikr = Future.value(List<Zikr>()).obs;

  ZikrController(this.name);

  @override
  void onInit() {
    super.onInit();
    getListZikr();
  }

  void getListZikr() async {
    listZikr.value = zikrService.fetchZikrList(name);
  }
}
