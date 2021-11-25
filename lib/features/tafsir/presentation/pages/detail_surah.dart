import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/specific_surah_controller.dart';
import 'package:tafsir/features/tafsir/domain/entities/specific_surah.dart';
import 'package:tafsir/features/tafsir/presentation/widgets/content_detail_surah.dart';
import 'package:tafsir/features/tafsir/presentation/widgets/header_detail_surah.dart';

class DetailSurah extends StatefulWidget {
  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  final controller = Get.put(SpecificSurahController());
  final arguments = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.setPage(arguments.number.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
                text: arguments.name.transliteration.id,
                style: Theme.of(context).textTheme.bodyText1)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height / 2.4,
              flexibleSpace: FlexibleSpaceBar(
                background: HeaderDetailSurah(arguments: arguments),
              ),
            ),
          ];
        },
        body: Obx(
          () => FutureBuilder<SpecificSurah>(
            future: controller.specifSurah,
            builder: (context, snap) {
              if (snap.hasData) {
                return ListView.builder(
                  itemCount: snap.data.data.verses.length,
                  itemBuilder: (builder, index) {
                    return ContentDetailSurah(
                        data: snap.data.data, index: index);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
