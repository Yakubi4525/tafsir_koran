import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tafsir/core/datasources/cache_helper.dart';
import 'package:tafsir/features/pray_time/data/datasources/pray_services.dart';
import 'package:tafsir/features/pray_time/domain/entities/list_paray.dart';

class PrayController extends GetxController {

  PrayController(){
    getData();
  }
  var year = formatDate(DateTime.now(), [yyyy]);
  var day = formatDate(DateTime.now(), [dd]);
  var k = DateFormat('kk').format(DateTime.now());
  var m = DateFormat('mm').format(DateTime.now());
  PrayServices _prayServices = PrayServices();
  ListPray listPray;
  String time = '';

  void getData() async {
    String country = CacheHelper.getData('country');
    String city = CacheHelper.getData('city');
    await _prayServices
        .fetchSurah(int.parse(year), int.parse(day),country,city)
        .then((value) {
      listPray = value;
    }).catchError(
      (error) {
        print(error);
      },
    );
    print(CalculateTime().fajr());
    update();
  }


  int containerColor(){
    NextPrayAfter nextPrayAfter = NextPrayAfter();
    NextPrayBefore nextPrayBefore = NextPrayBefore();
    int index=0;
    if(!nextPrayAfter.fajr() && !nextPrayBefore.isha()){
      //fajr
      index = 0;
    }else if (!nextPrayAfter.sunrise() && !nextPrayBefore.fajr()){
      //sunrise
      index = 1;
    }else if (!nextPrayAfter.dhuhr() && !nextPrayBefore.sunrise()){
      //dhuhr
      index = 2;
    }else if (!nextPrayAfter.asr() && !nextPrayBefore.dhuhr()){
     //asr
      index = 3;
    }else if (!nextPrayAfter.maghrib() && !nextPrayBefore.asr()){
      //maghrib
      index = 4;
    }else if (!nextPrayAfter.isha() && !nextPrayBefore.maghrib()){
      //isha
      index = 5;
    }
    return index;
  }

  String n(){
    return DateFormat('${calculateT()}:ss').format(DateTime.now());
  }

  String calculateT(){
    CalculateTime calculateTime = CalculateTime();
    if(containerColor() == 0){
      return calculateTime.fajr();
    }else if(containerColor() == 1){
      return calculateTime.sunrise();
    }else if(containerColor() == 2){
      return calculateTime.dhuhr();
    }else if(containerColor() == 3){
      return calculateTime.asr();
    }else if(containerColor() == 4){
      return calculateTime.maghrib();
    }else if(containerColor() == 5){
      return calculateTime.isha();
    }
    return '';
  }


}

class NextPrayAfter {
  DateTime now =DateTime.now();
  var day = formatDate(DateTime.now(), [dd]);
  var listPray = Get.find<PrayController>().listPray;
  bool fajr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.fajr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isAfter(prayTimeWithDay);
  }

  bool sunrise(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.sunrise).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isAfter(prayTimeWithDay);
  }

  bool dhuhr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.dhuhr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isAfter(prayTimeWithDay);
  }

  bool asr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.asr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isAfter(prayTimeWithDay);
  }

  bool maghrib(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.maghrib).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isAfter(prayTimeWithDay);
  }

  bool isha(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.isha).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isAfter(prayTimeWithDay);
  }

}

class NextPrayBefore {
  DateTime now =DateTime.now();
  var day = formatDate(DateTime.now(), [dd]);
  var listPray = Get.find<PrayController>().listPray;
  bool fajr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.fajr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isBefore(prayTimeWithDay);
  }

  bool sunrise(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.sunrise).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isBefore(prayTimeWithDay);
  }

  bool dhuhr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.dhuhr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isBefore(prayTimeWithDay);
  }

  bool asr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.asr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isBefore(prayTimeWithDay);
  }

  bool maghrib(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.maghrib).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isBefore(prayTimeWithDay);
  }

  bool isha(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.isha).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    return now.isBefore(prayTimeWithDay);
  }

}

class CalculateTime {
  DateTime now =DateTime.now();
  final listPray = Get.find<PrayController>().listPray;
  var day = formatDate(DateTime.now(), [dd]);

  String fajr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.fajr).substring(0,5);
    DateTime prayTimeWithDay = DateTime(now.year, now.month, now.day+1, int.tryParse(prayTime.substring(0,2)), int.tryParse(prayTime.substring(3,5)));
    DateTime days = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    print(prayTimeWithDay);
    print(days);
    int second = prayTimeWithDay.difference(days).inMinutes;
    int hours = prayTimeWithDay.difference(days).inHours;
    print(second);
    double minutes = ((second/60));
    return "${prayTimeWithDay.difference(days).inHours}";
  }
  String sunrise(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.sunrise).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    DateTime days = DateTime(now.year, now.month, now.day,now.hour,now.minute);
    int second = prayTimeWithDay.difference(days).inSeconds;
    int hours = prayTimeWithDay.difference(days).inHours;
    double minutes = (second/3600)*hours;
    return "$hours:${minutes.toInt()}";
  }
  String dhuhr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.dhuhr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    DateTime days = DateTime(now.year, now.month, now.day,now.hour,now.minute);
    int second = prayTimeWithDay.difference(days).inSeconds;
    int hours = prayTimeWithDay.difference(days).inHours;
    double minutes = (second/3600)*hours;
    return "${prayTimeWithDay.difference(days).toString().substring(0,4)}";
  }
  String asr(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.asr).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    DateTime days = DateTime(now.year, now.month, now.day,now.hour,now.minute);
    int second = prayTimeWithDay.difference(days).inSeconds;
    int hours = prayTimeWithDay.difference(days).inHours;
    double minutes = (second/3600)*hours;
    return "${prayTimeWithDay.difference(days).toString().substring(0,4)}";
  }
  String maghrib(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.maghrib).substring(0,5);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    DateTime days = DateTime(now.year, now.month, now.day,now.hour,now.minute);
    int second = prayTimeWithDay.difference(days).inSeconds;
    int hours = prayTimeWithDay.difference(days).inHours;
    double minutes = (second/3600)*hours;
    return "${prayTimeWithDay.difference(days).toString().substring(0,4)}";
  }
  String isha(){
    String prayTime=(listPray.data[int.parse(day)].timingsPray.isha);
    DateTime prayTimeWithDay=DateTime(now.year, now.month, now.day, int.tryParse(prayTime.substring(0,2)),int.tryParse(prayTime.substring(3,5)));
    DateTime days = DateTime(now.year, now.month, now.day,now.hour,now.minute);
    return "${prayTimeWithDay.difference(days).toString().substring(0,4)}";
  }

}


