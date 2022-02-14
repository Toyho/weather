import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather/db/db.dart';
import 'package:weather/model/daily_weather_model.dart';
import 'package:weather/model/sql_model.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/repository/weather_repository.dart';
import 'package:async/async.dart';

import 'state.dart';

class CityListLogic extends GetxController {
  final state = CityListState().obs;

  List<SQLModel> dbInfo = <SQLModel>[];

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void onInit() async {
    await _memoizer.runOnce(() async {
      await initDb();
      await getTodoItems();
    });
    super.onInit();
  }

  ////////////////

  Future<void> initDb() async {
    await DB.init();
  }

  Future<void> getTodoItems() async {
    List<Map<String, dynamic>> _results = await DB.query("todo_items");
    final map = _results.map((json) => SQLModel.fromJson(json)).toList();
    if (_results.isEmpty) {
      print("пусто");
    } else {
      dbInfo = map;
      print(dbInfo);
      try {
        dbInfo.forEach((element) async {
          WeatherModel item =
              await WeatherRepository().getNameCityWeather(element.cityName!);
          state.value.weather!.add(item);
          state.refresh();
        });
      } on DioError catch (_) {
        print(_);
      }
    }
    update();
  }

  Future<void> addTodoItem({required String cityName}) async {
    bool isCreatedCity = false;
    var qwe = await DB.query("todo_items");
    WeatherModel item = await WeatherRepository().getNameCityWeather(cityName);
    for (var element in qwe) {
      if (element['cityName'] == item.name!) {
        isCreatedCity = true;
      }
    }
    if (!isCreatedCity) {
      SQLModel itemSQL = SQLModel(cityName: item.name!);
      await DB.insert("todo_items", itemSQL);
      var qwe = await DB.query("todo_items");
      print(qwe);
      state.value.weather!.add(item);
      state.value.isSearch = false;
      state.refresh();
      update();
    }
  }

  Future<void> deleteTodoItem(WeatherModel city) async {
    SQLModel? itemSQL;
    var qwe = await DB.query("todo_items");
    for (var element in qwe) {
      if (element['cityName'] == city.name) {
        itemSQL = SQLModel.fromJson(element);
      }
    }
    await DB.delete("todo_items", itemSQL!);
    state.value.weather!.remove(city);
    state.refresh();
    update();
  }

  ////////////////////////////

  Future<DailyWeatherModel> getLocationDailyWeather(
      {String? lat, String? lon}) async {
    DailyWeatherModel posts =
        await WeatherRepository().getLocalDailyWeather(lat!, lon!);
    print(posts.timezone);
    return posts;
  }

  void changeSearch() {
    state.value.isSearch = !state.value.isSearch!;
    state.refresh();
  }

}
