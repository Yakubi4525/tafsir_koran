import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/pray_controller.dart';
import 'package:tafsir/core/constants/constants.dart';
import 'package:tafsir/core/style/dimensions.dart';
import 'package:tafsir/features/pray_time/presentation/widgets/appbar_container.dart';
import 'package:tafsir/features/pray_time/presentation/widgets/chapter_titles.dart';
import 'package:tafsir/features/pray_time/presentation/widgets/location_information.dart';
import 'package:tafsir/features/pray_time/presentation/widgets/title_pray.dart';

class PrayTimePage extends StatelessWidget {
  PrayTimePage({Key key}) : super(key: key);
  final controller = Get.find<PrayController>();

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      builder: (context) => GetBuilder<PrayController>(
        init: PrayController(),
        builder: (controller) => Scaffold(
          extendBodyBehindAppBar: false,
          body: Column(
            children: [
              Container(
                height: mediaHeight(context) / 2.24,
                child: Stack(
                  children: [
                    AppbarContainer(),
                    Positioned(
                      top: mediaHeight(context) / 4.5,
                      right: mediaWidth(context) / 14,
                      left: mediaWidth(context) / 14,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 20,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        height: mediaHeight(context) / 4.5,
                        width: mediaWidth(context),
                        child: LocationInformation(),
                      ),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 20.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25.0,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: padding(context),
                  child: Column(
                    children: [
                      TitlePray(),
                      hSizedBox1,
                      Column(
                        children: List.generate(
                          6,
                          (index) => buildListPray(index, context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      fallback: (context) =>
          Scaffold(body: Center(child: CircularProgressIndicator())),
      condition: controller.listPray.data.length != 0,
    );
  }

  Widget buildListPray(int index,context) => Column(
        children: [
          Container(
            height: mediaHeight(context)*0.053,
            decoration: controller.containerColor() == index
                ? BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  )
                : BoxDecoration(color: Colors.transparent),
            child: Center(
              child: ChapterTitles(
                text1: prayer[index],
                fontSize: 20,
                text2: adhan[index].substring(0, 6),
              ),
            ),
          ),
        ],
      );
}
