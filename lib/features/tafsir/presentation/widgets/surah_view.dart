import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';


import 'package:get/instance_manager.dart';
import 'package:tafsir/controlllers/list_surah_controller.dart';
import 'package:tafsir/features/tafsir/domain/entities/list_surah.dart';
import 'package:tafsir/features/tafsir/presentation/widgets/border_number.dart';

class SurahView extends StatelessWidget {
  final controller = Get.put(ListSurahController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return FutureBuilder<ListSurah>(
        future: controller.listSurah.value,
        builder: (builder, snap) {
          if (snap.hasData) {
            return ListView.separated(
              itemCount: snap.data.data.length,
              itemBuilder: (context, i) {
                var dataIndex = snap.data.data[i];
                return ListTile(
                  onTap: () {
                    Get.toNamed('/detail-surah', arguments: dataIndex);
                  },
                  leading: BorderNumber(number: dataIndex.number),
                  title: Text(dataIndex.name.transliteration.id,
                      style: Theme.of(context).textTheme.bodyText2),
                  subtitle: Text(
                      '${dataIndex.revelation.id.toString().replaceAll('Id.', '').capitalize} - ${dataIndex.numberOfVerses} ayat',
                      style: Theme.of(context).textTheme.subtitle1),
                  trailing: Text(dataIndex.name.short,
                      style: Theme.of(context).textTheme.bodyText1),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.6);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    });
  }
}
