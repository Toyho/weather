import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/db/db.dart';
import 'package:weather/detail_weather/detail_weather/logic.dart';
import 'package:weather/model/sql_model.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/repository/weather_repository.dart';
import 'package:async/async.dart';

import 'state.dart';

class CityListLogic extends GetxController {
  final state = CityListState().obs;
  final logic = Get.put(DetailWeatherLogic());

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
    if(_results.isEmpty) {
      print("пусто");
    } else {
      dbInfo = map;
      print(dbInfo);
      await getNameWeather(dbInfo);
    }
    update();
  }

  Future<void> addTodoItem() async {
    SQLModel item = SQLModel(cityName: "Курск");
    await DB.insert("todo_items", item);
    await getTodoItems();
  }

  Future<void> deleteTodoItem(SQLModel item) async {
    await DB.delete("todo_items", item);
    await getTodoItems();
  }

  ////////////////////////////

  Future<void> getNameWeather(List<SQLModel> dbInfo) async {
    try {
      dbInfo.forEach((element) async {
        WeatherModel posts = await WeatherRepository().getNameCityWeather(element.cityName!);
        state.value.weather!.add(posts);
        print(state.value.weather![0].name);
        state.refresh();
      });
      state.refresh();

    } on DioError catch (_) {
      print(_);
    }
  }

  Future<void> getNameDailyWeather() async {
    try {
      WeatherModel posts = await WeatherRepository().getNameCityWeather("Орел");
      print(posts.main!.temp!);
      // state.value.dailyWeather = posts;
      state.refresh();

    } on DioError catch (_) {
      print(_);
    }
  }

}
