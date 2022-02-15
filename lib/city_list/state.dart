import 'package:weather/model/weather_model.dart';

enum ListCityStatus {init, success, empty}

class CityListState {
  List<WeatherModel>? weather;
  bool? isSearch;
  ListCityStatus listCityStatus;
  // DailyWeatherModel? dailyWeather;

  CityListState({
    List<WeatherModel>? weather,
    this.isSearch = false,
    this.listCityStatus = ListCityStatus.init,
    // this.dailyWeather,
  }) : weather = weather ?? [];

  CityListState copyWith({
    List<WeatherModel>? weather,
    // DailyWeatherModel? dailyWeather,
  }) {
    return CityListState(
      weather: weather ?? this.weather,
      // dailyWeather: dailyWeather ?? this.dailyWeather,
    );
  }
}
