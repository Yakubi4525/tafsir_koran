class DataTimePray {
  String readable;
  String timestamp;
  Gregorian gregorian;
  Hijri hijri;

  DataTimePray({
    this.gregorian,
    this.readable,
    this.timestamp,
    this.hijri,
  });

  DataTimePray.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    readable = json['readable'];
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json["gregorian"])
        : null;
    hijri = json['hijri'] != null ? Hijri.fromJson(json["hijri"]) : null;
  }

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'readable': readable,
        'gregorian': gregorian.toJson(),
        'hijri': hijri.toJson(),
      };
}

class Gregorian {
  String data;
  String format;
  String day;
  String year;
  Weekday weekday;
  Month month;

  Gregorian({
    this.weekday,
    this.data,
    this.day,
    this.format,
    this.month,
    this.year,
  });

  Gregorian.fromJson(Map<String, dynamic> json) {
    data = json['date'];
    format = json['format'];
    day = json['day'];
    year = json['year'];
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json["weekday"]) : null;
  }

  Map<String, dynamic> toJson() => {
        'date': data,
        'format': format,
        'day': day,
        'year': year,
        'weekday': weekday.toJson(),
        'month': month.toJson(),
      };
}

class Weekday {
  String enDay;

  Weekday({this.enDay});

  Weekday.fromJson(Map<String, dynamic> json) {
    enDay = json['en'];
  }

  Map<String, dynamic> toJson() => {
        'en': enDay,
      };
}

class Month {
  int number;
  String enMonth;

  Month({this.number, this.enMonth});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    enMonth = json['en'];
  }

  Map<String, dynamic> toJson() => {
        'en': enMonth,
        'number': number,
      };
}

class Hijri {
  String data;
  String format;
  String day;
  String year;
  MonthHijri monthHijri;
  WeekdayHijri weekday;

  Hijri({
    this.weekday,
    this.data,
    this.monthHijri,
    this.year,
    this.day,
    this.format,
  });

  Hijri.fromJson(Map<String, dynamic> json) {
    data = json['date'];
    format = json['format'];
    day = json['day'];
    year = json['year'];
    weekday =
        json['weekday'] != null ? WeekdayHijri.fromJson(json["weekday"]) : null;
    monthHijri =
        json['month'] != null ? MonthHijri.fromJson(json["month"]) : null;
  }

  Map<String, dynamic> toJson() => {
        'date': data,
        'format': format,
        'day': day,
        'year': year,
        'weekday': weekday.toJson(),
        'month': weekday.toJson(),
      };
}

class WeekdayHijri {
  String enHijri;

  WeekdayHijri({this.enHijri});

  WeekdayHijri.fromJson(Map<String, dynamic> json) {
    enHijri = json['en'];
  }

  Map<String, dynamic> toJson() => {
        'en': enHijri,
      };
}

class MonthHijri {
  int number;

  MonthHijri({
    this.number,
  });

  MonthHijri.fromJson(Map<String, dynamic> json) {
    number = json['number'];
  }

  Map<String, dynamic> toJson() => {
        'number': number,
      };
}
