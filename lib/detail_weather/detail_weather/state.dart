import 'package:weather/model/weather_model.dart';

class DetailWeatherState {

  WeatherModel? weather;

  DetailWeatherState({
    this.weather
  });

  DetailWeatherState copyWith({
    WeatherModel? weather,
  }) {
    return DetailWeatherState(
      weather: weather ?? this.weather,
    );
  }
}
