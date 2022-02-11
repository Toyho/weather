import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/repository/weather_repository.dart';

import 'state.dart';

class DetailWeatherLogic extends GetxController {
  final state = DetailWeatherState().obs;

  @override
  void onInit() async{
    await getNameWeather();
    super.onInit();
  }

  Future<void> getNameWeather() async {
    try {
      WeatherModel posts = await WeatherRepository().getNameCityWeather("Орел");
      print(posts.main!.temp);
      state(DetailWeatherState(weather: posts));
      print(state.value.weather!.main!.temp!);
      update();

    } on DioError catch (_) {
      print(_);
    }
  }

}
