import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/features/zikr/presentation/widgets/zikr_header.dart';

class ZikrPage extends StatelessWidget {
  const ZikrPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          "Ежедневные азкары",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            ZikrHeader(
              whenRead: 'Читай утром',
              zikrName: 'Утренные азкары',
              onTap: () {
                Get.toNamed('/morning-zikr');
              },
            ),
            ZikrHeader(
              whenRead: 'Читай вечером',
              zikrName: 'Вечерные азкары',
              onTap: () {
                Get.toNamed('/night-zikr');
              },
            ),
            ZikrHeader(
              whenRead: 'Читай после молитвы',
              zikrName: 'Азкары после молитвы',
              onTap: () {
                Get.toNamed('/pray-zikr');
              },
            ),
            ZikrHeader(
              whenRead: 'Читай всегда',
              zikrName: 'Важные дуа',
              onTap: () {
                Get.toNamed('/important-zikr');
              },
            ),
          ],
        ),
      ),
    );
  }
}
