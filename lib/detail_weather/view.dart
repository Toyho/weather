import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import 'logic.dart';

class DetailWeatherPage extends StatelessWidget {
  final logic = Get.put(DetailWeatherLogic());
  final state = Get.find<DetailWeatherLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      children: [
        Obx(() {
          return state.value.weather != null
              ? Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      0.186,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white.withOpacity(0.3),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            state.value.weather!.main!.temp!
                                .toStringAsFixed(0) +
                                "°",
                            style: TextStyle(
                                fontSize: 42,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Text(
                                state.value.weather!.name!,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Image.asset(
                                "assets/icons_weather/${state.value.weather!.weather![0].icon}.png",
                                width: 50,
                                height: 50,
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white),
                              children: [
                                const WidgetSpan(
                                  alignment:
                                  PlaceholderAlignment
                                      .middle,
                                  child: BoxedIcon(
                                    WeatherIcons.strong_wind,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: ": ",
                                ),
                                TextSpan(
                                  text: state.value.weather!
                                      .wind!.speed!
                                      .toString(),
                                ),
                                TextSpan(
                                  text: " м/с",
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white),
                              children: [
                                const WidgetSpan(
                                  alignment:
                                  PlaceholderAlignment
                                      .middle,
                                  child: BoxedIcon(
                                    WeatherIcons.cloud,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: ": ",
                                ),
                                TextSpan(
                                  text: state.value.weather!
                                      .clouds!.all!
                                      .toString(),
                                ),
                                TextSpan(
                                  text: " %",
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white),
                              children: [
                                const WidgetSpan(
                                  alignment:
                                  PlaceholderAlignment
                                      .middle,
                                  child: BoxedIcon(
                                    WeatherIcons.raindrop,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: ": ",
                                ),
                                TextSpan(
                                  text: state.value.weather!
                                      .main!.humidity!
                                      .toString(),
                                ),
                                TextSpan(
                                  text: " %",
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
              : Center(child: CircularProgressIndicator());
        }),
        Obx(() {
          return state.value.dailyWeather != null
              ? Column(children: [
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount:
                state.value.dailyWeather!.daily!.length - 1,
                itemBuilder: (context, item) {
                  var parseTimestamp =
                  DateTime.fromMillisecondsSinceEpoch(state
                      .value
                      .dailyWeather!
                      .daily![item + 1]
                      .dt! *
                      1000);
                  var date = DateFormat('dd/MM')
                      .format(parseTimestamp);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 14),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          color: Colors.white.withOpacity(0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/icons_weather/${state.value.dailyWeather!.daily![item + 1].weather![0].icon}.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text(
                                      state
                                          .value
                                          .dailyWeather!
                                          .daily![item + 1]
                                          .weather![0]
                                          .description
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white)),
                                ],
                              ),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: state.value.dailyWeather!.daily![item + 1].temp!.max!.toStringAsFixed(0) + "°/",
                                    ),
                                    TextSpan(
                                      text: state.value.dailyWeather!.daily![item + 1].temp!.min!.toStringAsFixed(0) + "°",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ])
              : Center(child: CircularProgressIndicator());
        }),
      ],
    );
  }
}
