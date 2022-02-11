import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather/api/local_weather_api.dart';

class WeatherRepository {
  static final WeatherRepository _singletonUserRepository =
  WeatherRepository._internal();

  factory WeatherRepository() {
    return _singletonUserRepository;
  }

  WeatherRepository._internal();

  Future<dynamic> getLocalWeather(String lat, String lon) async {
    return await ApiClient(Dio()).getLocationWeather(lat, lon);
  }

  Future<dynamic> getNameCityWeather(String name) async {
    return await ApiClient(Dio()).getNameCityWeather(name);
  }
}