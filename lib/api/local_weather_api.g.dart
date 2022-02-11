// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_weather_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WeatherModel> getLocationWeather(lat, lon) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        WeatherModel>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/weather?lat=${lat}&lon=${lon}&appid=b9a9bf7b2cbf57e02e17f813c16469f9&lang=ru&units=metric',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatherModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WeatherModel> getNameCityWeather(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        WeatherModel>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/weather?q=${name}&appid=b9a9bf7b2cbf57e02e17f813c16469f9&lang=ru&units=metric',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatherModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
