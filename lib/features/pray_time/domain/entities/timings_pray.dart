class TimingsPray {
  TimingsPray({
    this.fajr,
    this.asr,
    this.dhuhr,
    this.isha,
    this.maghrib,
    this.sunrise,
  });

  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  factory TimingsPray.fromJson(Map<String, dynamic> json) => TimingsPray(
    fajr: json['Fajr'],
    sunrise: json['Sunrise'],
    dhuhr: json['Dhuhr'],
    asr: json['Asr'],
    maghrib: json['Maghrib'],
    isha: json['Isha'],
  );

  Map<String, dynamic> toJson() => {
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Maghrib": maghrib,
    "Isha": isha,
  };
}