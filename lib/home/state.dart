import 'package:weather/model/daily_weather_model.dart';
import 'package:weather/model/weather_model.dart';

class HomeState {

  WeatherModel? weather;
  DailyWeatherModel? dailyWeather;

  HomeState({
    this.weather,
    this.dailyWeather,
  });

  HomeState copyWith({
    WeatherModel? weather,
    DailyWeatherModel? dailyWeather,
  }) {
    return HomeState(
      weather: weather ?? this.weather,
      dailyWeather: dailyWeather ?? this.dailyWeather,
    );
  }
}
