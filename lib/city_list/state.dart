import 'package:weather/model/weather_model.dart';

class CityListState {
  List<WeatherModel>? weather;
  // DailyWeatherModel? dailyWeather;

  CityListState({
    List<WeatherModel>? weather,
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
