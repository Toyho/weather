import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/model/daily_weather_model.dart';
import 'package:weather/repository/weather_repository.dart';

import 'state.dart';

class DetailWeatherLogic extends GetxController {
  final state = DetailWeatherState().obs;

  @override
  void onInit() async{
    await getNameWeather();
    await getNameDailyWeather();
    super.onInit();
  }

  Future<void> getNameWeather() async {
    try {
      Position position = await getLocation();
      // WeatherModel posts = await WeatherRepository().getNameCityWeather("Орел");
      WeatherModel posts = await WeatherRepository().getLocalWeather(position.latitude.toString(), position.longitude.toString());
      state.value.weather = posts;
      state.refresh();

    } on DioError catch (_) {
      print(_);
    }
  }

  Future<void> getNameDailyWeather() async {
    try {
      Position position = await getLocation();
      // WeatherModel posts = await WeatherRepository().getNameCityWeather("Орел");
      DailyWeatherModel posts = await WeatherRepository().getLocalDailyWeather(position.latitude.toString(), position.longitude.toString());
      print(posts.daily![1].weather![0].description);
      state.value.dailyWeather = posts;
      state.refresh();

    } on DioError catch (_) {
      print(_);
    }
  }

  Future<Position> getLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

}
