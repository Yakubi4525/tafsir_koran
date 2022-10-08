import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/zikr_controller.dart';
import 'package:tafsir/features/zikr/domain/entities/zikr.dart';
import 'package:tafsir/features/zikr/presentation/widgets/slider_zikr_widget.dart';

class NightZikrPage extends StatelessWidget {
  final controller = Get.put(ZikrController('night'));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return FutureBuilder<List<Zikr>>(
          future: controller.listZikr.value,
          builder: (builder, snap) {
            if (snap.hasData) {
              return SliderZikr(
                zikr: snap.data,
                pageTittle: '',
              );
            }
            return Scaffold();
          },
        );
      },
    );
  }
}
