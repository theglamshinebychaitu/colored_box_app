import 'dart:async';

import 'package:colored_box_app/infrastructure/controllers/home_controller.dart';
import 'package:colored_box_app/ui/box_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
              controller: homeController.numberController.value,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  hintText: "Enter from 3 to 10",
                  border: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
              onChanged: (val) {
                if(val.isNotEmpty){
                  Future.delayed(Duration(milliseconds: 500), () {
                    int input = int.parse(homeController.numberController.value.text);
                    if(input > 2 && input < 11) {
                      homeController.changeCount(input);
                    } else {
                      homeController.numberController.value.clear();
                    }
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(onPressed: () {
            Get.to(BoxPage());
          }, child: Text("Submit"),)
        ],
      ),
    );
  }
}
