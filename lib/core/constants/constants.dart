import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/pray_controller.dart';
import 'package:tafsir/features/pray_time/domain/entities/list_paray.dart';


const urlImage = 'assets/images';


EdgeInsets padding(context) {
  var displayHeight = MediaQuery.of(context).size.height;
  var displayWidth = MediaQuery.of(context).size.width;
  return EdgeInsets.only(
      top: displayHeight * 0.03,
      bottom: displayHeight * 0.01,
      left: displayWidth * 0.07,
      right: displayWidth * 0.07);
}
double mediaHeight(context) => MediaQuery.of(context).size.height;
double mediaWidth(context) => MediaQuery.of(context).size.width;

var listPray = Get.find<PrayController>().listPray;
var day = formatDate(DateTime.now(), [dd]);

List<String> adhan = [
  listPray.data[int.parse(day)].timingsPray.fajr,
  listPray.data[int.parse(day)].timingsPray.sunrise,
  listPray.data[int.parse(day)].timingsPray.dhuhr,
  listPray.data[int.parse(day)].timingsPray.asr,
  listPray.data[int.parse(day)].timingsPray.maghrib,
  listPray.data[int.parse(day)].timingsPray.isha,
];
List<String> prayer = [
  'Фаджр',
  'Восход',
  'Зухр',
  'Аср',
  'Магриб',
  'Иша',
];
