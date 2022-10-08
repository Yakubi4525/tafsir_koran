import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/features/zikr/domain/entities/zikr.dart';

class ImportantPageView extends StatelessWidget {
  const ImportantPageView({Key key, this.zikr}) : super(key: key);
  final List<Zikr> zikr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Важные дуа",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 8, left: 8),
        child: ListView.separated(
          itemCount: zikr.length,
          itemBuilder: (context, i) {
            var dataIndex = zikr[i];
            return ListTile(
              onTap: () {
                Get.toNamed('/detail-zikr', arguments: dataIndex);
              },
              title: Text(dataIndex.name,
                  style: Theme.of(context).textTheme.bodyText2),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(thickness: 0.6);
          },
        ),
      ),
    );
  }
}
