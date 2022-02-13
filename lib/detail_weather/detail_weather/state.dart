import 'package:weather/model/daily_weather_model.dart';
import 'package:weather/model/weather_model.dart';

class DetailWeatherState {

  WeatherModel? weather;
  DailyWeatherModel? dailyWeather;

  DetailWeatherState({
    this.weather,
    this.dailyWeather,
  });

  DetailWeatherState copyWith({
    WeatherModel? weather,
    DailyWeatherModel? dailyWeather,
  }) {
    return DetailWeatherState(
      weather: weather ?? this.weather,
      dailyWeather: dailyWeather ?? this.dailyWeather,
    );
  }
}
