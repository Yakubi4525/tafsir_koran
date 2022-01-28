import 'package:http/http.dart' as http;
import 'package:tafsir/features/pray_time/domain/entities/list_paray.dart';
import 'dart:convert';



class PrayServices {
  static var client = http.Client();

  Future<ListPray> fetchSurah(int year,int month) async {
    var response =
        await client.get("http://api.aladhan.com/v1/calendarByAddress?address=Sultanahmet%20Mosque,%20Istanbul,%20Turkey&method=1&month=0$month&year=$year");
    ListPray listPray;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonModel = json.decode(jsonString);
        listPray = ListPray.fromJson(jsonModel);
        print(listPray.data[0].timingsPray.fajr);
        return listPray;
      }
    } catch (e) {
      throw Exception(e);
    }

    return listPray;
  }
}
