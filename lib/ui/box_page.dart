import 'package:colored_box_app/infrastructure/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return GridView.count(
          crossAxisCount: homeController.count.value,
          children: List.generate(homeController.boxList.length, (index) {
            return InkWell(
              onTap: () {
                if((homeController.boxList[index].isBlue ?? false) && !(homeController.boxList[index].isRed ?? false)) {
                  homeController.boxChangeToRed(index);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                        color: ((homeController.boxList[index].isBlue ?? false) && (homeController.boxList[index].isRed ?? false))
                            ? Colors.red
                            : (homeController.boxList[index].isBlue ?? false)
                            ? Colors.blue : Colors.transparent
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
