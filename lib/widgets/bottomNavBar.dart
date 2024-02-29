import 'dart:io';
import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dvmastrsn/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ui.dart';

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  double get textSize => 10;

  @override
  TextStyle textStyle(Color color,String? fontFamily) {
    return TextStyle(fontSize: this.textSize, color: Colors.white);
  }


}

Widget BottomNavBar() {
  final Controller _conroller = Get.find();

  return StyleProvider(
      style: Style(),
      child: ConvexAppBar(
        height: 70,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.2, 1),
          colors: <Color>[
            Ui.backColorFrom,
            Ui.backColorTo2,
            Ui.backColorTo1,
            // Ui.backColorTo0,
          ],
          // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
        initialActiveIndex: _conroller.page.value,
        // color: Colors.white,
        backgroundColor: Ui.backColorTo1,
        color: Colors.white,
        activeColor: Ui.backColorTo1,
        curveSize: 20,
        // style: TabStyle.fixedCircle,
        // cornerRadius: 1,
        items: [
          TabItem(
            icon: Icon(
              Icons.car_repair,
              color: Colors.white,
              size: 25,
            ),
            title: "З-Наряд",

            // activeIcon: Icon(
            //   Icons.car_repair,
            //   color: Ui.backColorFrom,
            //   size: 30,
            // ),
          ),
          TabItem(
            icon: Icon(
              Icons.currency_exchange,
              color: Colors.white,
            ),
            title: "Вырабока",
            // activeIcon: Icon(
            //   Icons.car_repair,
            //   color: Ui.backColorFrom,
            //   size: 30,
            // ),
          ),
          TabItem(
            icon: Icon(
              Icons.miscellaneous_services,
              color: Colors.white,
            ),
            title: "Услуги",
            // activeIcon: Icon(
            //   Icons.miscellaneous_services,
            //   color: Ui.backColorFrom,
            //   size: 30,
            // ),
          ),
          TabItem(
            icon: Icon(
              Icons.emoji_transportation,
              color: Colors.white,
            ),
            title: "Предпродажка",
            // activeIcon: Icon(
            //   Icons.miscellaneous_services,
            //   color: Ui.backColorFrom,
            //   size: 30,
            // ),
          ),
          TabItem(
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
            title: "Выход",
            // activeIcon: Icon(
            //   Icons.exit_to_app_sharp,
            //   color: Ui.backColorFrom,
            //   size: 30,
            // ),
          ),
        ],
        onTap: (int index) {
          if (index != 4) {
            _conroller.changePage(index + 1);
          } else {
            exit(0);
          }
          _conroller.changePage(index);
        },
      ));
}
