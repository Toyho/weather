import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/city_list/state.dart';
import 'package:weather/detail_weather/logic.dart';

import 'logic.dart';

class CityListScreen extends StatelessWidget {
  final logic = Get.put(CityListLogic());
  final state = Get.find<CityListLogic>().state;

  final _stateDetail = Get.find<DetailWeatherLogic>().state;

  final searchController = TextEditingController();

  CityListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        children: [
          state.value.listCityStatus == ListCityStatus.success
              ? Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: state.value.weather!.length,
                        itemBuilder: (context, item) {
                          return GestureDetector(
                            onDoubleTap: () async {
                              _stateDetail.value.weather =
                                  state.value.weather![item];
                              _stateDetail.refresh();
                              _stateDetail.value.dailyWeather =
                                  await logic.getLocationDailyWeather(
                                lat: state.value.weather![item].coord!.lat!
                                    .toString(),
                                lon: state.value.weather![item].coord!.lon!
                                    .toString(),
                              );
                              _stateDetail.refresh();
                            },
                            onLongPress: () {
                              logic.deleteTodoItem(state.value.weather![item]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 14),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 12),
                                    color: Colors.white.withOpacity(0.3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(state.value.weather![item]
                                            .weather![0].description!),
                                        Text(state.value.weather![item].name!),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                )
              : state.value.listCityStatus == ListCityStatus.init ? Center(child: CircularProgressIndicator()) : SizedBox(),
          GestureDetector(
            onTap: () {
              logic.changeSearch();
              // logic.addTodoItem(cityName: "Курск");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: Colors.white.withOpacity(0.3),
                    child: !state.value.isSearch! ? Icon(Icons.add) : TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            logic.addTodoItem(cityName: searchController.text);
                            searchController.clear();
                          },
                          icon: Icon(Icons.search, color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
