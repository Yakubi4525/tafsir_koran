import 'package:http/http.dart' as http;
import 'package:tafsir/features/pray_time/domain/entities/list_paray.dart';
import 'dart:convert';



class PrayServices {
  static var client = http.Client();
  ListPray listPray;
  Future<ListPray> fetchSurah(int year,int month, String country,String city) async {
    var response =
    await client.get("http://api.aladhan.com/v1/calendarByCity?city=$city&country=$country&method=13&month=0$month&year=$year");
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonModel = json.decode(jsonString);
        listPray = ListPray.fromJson(jsonModel);
        return listPray;
      }
    } catch (e) {
      throw Exception(e);
    }
    return listPray;
  }
}
