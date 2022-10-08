class Meta {
  int latitude;
  int longitude;
  String timezone;
  Method method;

  Meta({
    this.method,
    this.latitude,
    this.longitude,
    this.timezone,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = Method.fromJson(json['method']);
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'method': method.toJson(),
      };
}

class Method {
  int id;
  String name;
  Params params;
  Location location;
  String latitudeAdjustmentMethod;
  String midnightMode;
  String school;

  Method({
    this.location,
    this.params,
    this.name,
    this.id,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
  });

  Method.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    params = Params.fromJson(json['params']);
    location = Location.fromJson(json['location']);
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'params': params.toJson(),
        'location': location.toJson(),
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
        'midnightMode': midnightMode,
        'school': school,
      };
}

class Params {
  int fajr;
  int isha;

  Params({
    this.isha,
    this.fajr,
  });

  Params.fromJson(Map<String, dynamic> json) {
    fajr = json['fajr'];
    isha = json['isha'];
  }

  Map<String, dynamic> toJson() => {
        'isha': isha,
        'fajr': fajr,
      };
}

class Location {
  int latitude;
  int longitude;

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
      };
}
