import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tafsir/features/zikr/domain/entities/zikr.dart';

// import 'package:tafsir/core/zikr_json/pray_zikr.json' as pray_zikr_json;
// import 'package:tafsir/core/zikr_json/night_zikr.json' as night_zikr_json;
// import 'package:tafsir/core/zikr_json/morning_zikr.json' as morning_zikr_json;
// import 'package:tafsir/core/zikr_json/important_zikr.json'
//     as importat_zikr_json;

const pray_path = 'lib/core/zikr_json/pray_zikr.json';
const morning_path = 'lib/core/zikr_json/morning_zikr.json';
const night_path = 'package:tafsir/core/zikr_json/night_zikr.json';
const important_path = 'package:tafsir/core/zikr_json/important_zikr.json';

class ZikrService {
  Future<String> getJson({@required String path}) {
    return rootBundle.loadString(path);
  }

  Future<List<Zikr>> fetchZikrList(String name) async {
    List<Zikr> zikrList=[];
    var data;
    if (name == "morning") {
       data = json.decode(await getJson(path: morning_path));
    } else if (name == "night") {
       data = json.decode(await getJson(path: night_path));
    } else if (name == "pray") {
       data = json.decode(await getJson(path: pray_path));
    } else if (name == "important") {
       data = json.decode(await getJson(path: important_path));
    }
    print('dataaaa $data');
    for(final res in data){
      if(res!=null){
        zikrList.add(Zikr.fromJson(res));
      }
    }
    return zikrList;
  }
}
