import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/resource/strings.dart';

part 'local_weather_api.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/weather?lat={lat}&lon={lon}&appid=${Strings.apiKey}&lang=ru&units=metric')
  Future<WeatherModel> getLocationWeather(
      @Path("lat") String lat, @Path("lon") String lon);

  @GET('/weather?q={name}&appid=${Strings.apiKey}&lang=ru&units=metric')
  Future<WeatherModel> getNameCityWeather(@Path("name") String name);
}
