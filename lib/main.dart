import 'package:flutter/material.dart';
import 'package:weather/splash_screen.dart';

import 'detail_weather/detail_weather/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailWeatherScreen(),
    );
  }
}


