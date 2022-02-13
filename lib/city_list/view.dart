import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CityListScreen extends StatelessWidget {
  final logic = Get.put(CityListLogic());
  final state = Get.find<CityListLogic>().state;

  CityListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        state.value.weather!.isNotEmpty
            ? Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: state.value.weather!.length,
                    itemBuilder: (context, item) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              color: Colors.white.withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.value.weather![item].weather![0]
                                      .description!),
                                  Text(state.value.weather![item].name!),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            )
            : CircularProgressIndicator(),
        GestureDetector(
          onTap: () {
            logic.addTodoItem();
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
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
