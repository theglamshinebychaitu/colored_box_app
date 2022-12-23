import 'dart:math';

import 'package:colored_box_app/infrastructure/models/box_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> numberController = TextEditingController().obs;
  RxInt count = 0.obs;
  RxList<int> indexList = <int>[].obs;
  RxList<BoxModel> boxList = <BoxModel>[].obs;

  changeCount(int input) async {
    count.value = input;
    await createBoxList();
    await randomBoxChangeToBlue();
  }

  createBoxList() {
    boxList.clear();
    indexList.clear();
    for(int i = 0; i < (count.value*count.value); i++){
      boxList.add(BoxModel(id: i, isBlue: false, isRed: false));
      indexList.add(i);
    }
  }

  randomBoxChangeToBlue() {
    int randomNumber = indexList[Random().nextInt(indexList.length)];
      boxList[boxList.indexWhere((element) => element.id == randomNumber)] = BoxModel(id: randomNumber, isBlue: true, isRed: false);
      indexList.remove(randomNumber);
  }

  boxChangeToRed(int index) {
    boxList[boxList.indexWhere((element) => element.id == index)] = BoxModel(id: index, isBlue: true, isRed: true);
    randomBoxChangeToBlue();
  }
}