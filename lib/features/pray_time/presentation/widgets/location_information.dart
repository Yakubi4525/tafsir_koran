import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/pray_controller.dart';
import 'package:tafsir/core/components/custom_text.dart';
import 'package:tafsir/core/datasources/cache_helper.dart';
import 'package:tafsir/core/style/dimensions.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:timer_builder/timer_builder.dart'; //for date locale

class LocationInformation extends StatelessWidget {
  LocationInformation({Key key}) : super(key: key);
  final controller = Get.find<PrayController>();

  @override
  Widget build(BuildContext context) {
    print('${controller.time}>>>>>>>>>>>>>>');
    initializeDateFormatting("ru_RU");
    String date = DateFormat.yMMMMd("ru_RU").format(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_location,
                      ),
                      wSizedBox1,
                      CustomText(
                          text:
                              '${CacheHelper.getData('country')}/ ${CacheHelper.getData('city')}',
                          fontSize: null)
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.edit,
                  ),
                ],
              ),
              hSizedBox2,
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                  ),
                  wSizedBox1,
                  CustomText(
                    text: date,
                    fontSize: 20,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              children: [
                CustomText(
                  text: 'Следующий намаз через',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  alignment: Alignment.center,
                ),
                TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                  print("ccc");
                  return Text(
                    "${controller.n()}",
                    style: TextStyle(
                        color: Color(0xff2d386b),
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  );
                }),

              ],
            ),
          )
        ],
      ),
    );
  }
}
