import 'package:tafsir/features/pray_time/domain/entities/timings_pray.dart';

import 'data_time_pray.dart';

class ListDataPray {
  DataTimePray dataTimePray;
  TimingsPray timingsPray;

  ListDataPray({
    this.timingsPray,
    this.dataTimePray,
  });

  ListDataPray.fromJson(Map<String, dynamic>json){
    dataTimePray = json['date'] != null ? DataTimePray.fromJson(json['date']) : null;
    timingsPray = json['timings'] != null ? TimingsPray.fromJson(json['timings']) : null;
  }

  Map<String,dynamic> toJson() => {
    'date':dataTimePray.toJson(),
    'timings':timingsPray.toJson(),
  };
}
