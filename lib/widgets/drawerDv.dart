import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/Controller.dart';
import '../ui.dart';

final Controller _conroller = Get.find();

class DrawerDv extends StatelessWidget {
  const DrawerDv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.2, 1),
              colors: <Color>[
                Ui.backColorFrom,
                Ui.backColorTo2,
                Ui.backColorTo1,
                Ui.backColorTo0,
              ],
              // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.2, 1),
                      colors: <Color>[
                        Ui.backColorFrom,
                        Ui.backColorTo2,
                        Ui.backColorTo1,
                        Ui.backColorTo0,
                      ],
                      // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          Ui.companyName,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Ui.fontMontserrat,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'тел:  ${Ui.telephon}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: Ui.fontMontserrat,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
              InkWell(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Заказ-наряд",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: Ui.fontMontserrat),
                    )),

                onTap: () {
                  _conroller.changePage(1);
                  Navigator.pop(context);
                },
                // mouseCursor: MouseCursor.defer,
                // onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(color: Colors.white24),
              ),
              InkWell(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Выработка",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: Ui.fontMontserrat),
                    )),

                onTap: () {
                  _conroller.changePage(2);
                  Navigator.pop(context);
                },
                // mouseCursor: MouseCursor.defer,
                // onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(color: Colors.white24),
              ),
              InkWell(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Услуги",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: Ui.fontMontserrat),
                    )),

                onTap: () {
                  _conroller.changePage(3);
                  Navigator.pop(context);

                  // Scaffold.of(context).closeDrawer();
                },
                // mouseCursor: MouseCursor.defer,
                // onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(color: Colors.white24),
              ),
              InkWell(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Выход",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: Ui.fontMontserrat),
                    )),
                onTap: () {
                  exit(0);
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(color: Colors.white24),
              ),
            ],
          )),
    );
  }
}
