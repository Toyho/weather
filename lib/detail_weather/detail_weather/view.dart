import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class DetailWeatherScreen extends StatelessWidget {
  final logic = Get.put(DetailWeatherLogic());
  final state = Get.find<DetailWeatherLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Погода"),
      ),
      body: ListView(
        children: [
          Obx(() {
            return Center(
              child: state.value.weather != null ? Text(
                state.value.weather!.main!.temp.toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ) : CircularProgressIndicator(),
            );
          }),
          // FutureBuilder(
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       _weather = snapshot.data;
          //       if (_weather == null) {
          //         return Text("Error getting weather");
          //       } else {
          //         return Column(children: [
          //           createAppBar(locations, location, context),
          //           weatherBox(_weather),
          //           weatherDetailsBox(_weather),
          //         ]);
          //       }
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          //   future: state.getCurrentWeather(location),
          // ),
        ],
      ),
    );
  }
}
