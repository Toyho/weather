import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/city_list/view.dart';
import 'package:weather/detail_weather/view.dart';

import 'logic.dart';

class HomeScreen extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Детальный прогноз",
              ),
              Tab(
                text: "Список городов",
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: TabBarView(
            children: [
              DetailWeatherPage(),
              CityListScreen()
            ],
          ),
        ),
      ),
    );
  }
}
