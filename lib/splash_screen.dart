import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Погода"),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
