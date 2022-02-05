
import 'package:get/get.dart';
import 'package:tafsir/controlllers/pray_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrayController());
  }
}