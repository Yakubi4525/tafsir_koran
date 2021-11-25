import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tafsir/features/tafsir/domain/entities/specific_surah.dart';


class SpecificSurahServices {
  static var client = http.Client();

  static Future<SpecificSurah> fetchSurah(String page) async {
    print('pageeeeeeee $page');
    var response =
        await client.get("https://api.quran.sutanlab.id/surah/" + page);
    var specificSurah;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonModel = json.decode(jsonString);
        specificSurah = SpecificSurah.fromJson(jsonModel);

        return specificSurah;
      }
    } catch (e) {
      throw Exception(e);
    }

    return specificSurah;
  }
}
