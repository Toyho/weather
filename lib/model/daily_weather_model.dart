class DailyWeatherModel {
  DailyWeatherModel({
      double? lat, 
      double? lon, 
      String? timezone, 
      int? timezoneOffset, 
      List<Daily>? daily,}){
    _lat = lat;
    _lon = lon;
    _timezone = timezone;
    _timezoneOffset = timezoneOffset;
    _daily = daily;
}

  DailyWeatherModel.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _timezone = json['timezone'];
    _timezoneOffset = json['timezone_offset'];
    if (json['daily'] != null) {
      _daily = [];
      json['daily'].forEach((v) {
        _daily?.add(Daily.fromJson(v));
      });
    }
  }
  double? _lat;
  double? _lon;
  String? _timezone;
  int? _timezoneOffset;
  List<Daily>? _daily;

  double? get lat => _lat;
  double? get lon => _lon;
  String? get timezone => _timezone;
  int? get timezoneOffset => _timezoneOffset;
  List<Daily>? get daily => _daily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['timezone'] = _timezone;
    map['timezone_offset'] = _timezoneOffset;
    if (_daily != null) {
      map['daily'] = _daily?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Daily {
  Daily({
      int? dt, 
      int? sunrise, 
      int? sunset, 
      int? moonrise, 
      int? moonset, 
      double? moonPhase, 
      Temp? temp, 
      Feels_like? feelsLike, 
      int? pressure, 
      int? humidity,
      double? windSpeed, 
      int? windDeg, 
      double? windGust, 
      List<Weather>? weather, 
      int? clouds,
      double? rain,}){
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _moonrise = moonrise;
    _moonset = moonset;
    _moonPhase = moonPhase;
    _temp = temp;
    _pressure = pressure;
    _humidity = humidity;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _windGust = windGust;
    _weather = weather;
    _clouds = clouds;
}

  Daily.fromJson(dynamic json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'];
  }
  int? _dt;
  int? _sunrise;
  int? _sunset;
  int? _moonrise;
  int? _moonset;
  double? _moonPhase;
  Temp? _temp;
  int? _pressure;
  int? _humidity;
  double? _windSpeed;
  int? _windDeg;
  double? _windGust;
  List<Weather>? _weather;
  int? _clouds;

  int? get dt => _dt;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;
  int? get moonrise => _moonrise;
  int? get moonset => _moonset;
  double? get moonPhase => _moonPhase;
  Temp? get temp => _temp;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  double? get windSpeed => _windSpeed;
  int? get windDeg => _windDeg;
  double? get windGust => _windGust;
  List<Weather>? get weather => _weather;
  int? get clouds => _clouds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['moonrise'] = _moonrise;
    map['moonset'] = _moonset;
    map['moon_phase'] = _moonPhase;
    if (_temp != null) {
      map['temp'] = _temp?.toJson();
    }
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    map['wind_gust'] = _windGust;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['clouds'] = _clouds;
    return map;
  }

}

class Weather {
  Weather({
      int? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

class Feels_like {
  Feels_like({
      double? day, 
      double? night, 
      double? eve, 
      double? morn,}){
    _day = day;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Feels_like.fromJson(dynamic json) {
    _day = json['day'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }
  double? _day;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}

class Temp {
  Temp({
      double? day, 
      double? min, 
      double? max, 
      double? night, 
      double? eve, 
      double? morn,}){
    _day = day;
    _min = min;
    _max = max;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Temp.fromJson(dynamic json) {
    _day = json['day'] as double;
    _min = json['min'];
    _max = json['max'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }
  double? _day;
  double? _min;
  double? _max;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get min => _min;
  double? get max => _max;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['min'] = _min;
    map['max'] = _max;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}