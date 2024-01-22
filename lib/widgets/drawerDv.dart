import 'dart:math';

import 'package:flutter/material.dart';

import '../ui.dart';

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

                onTap: () {},
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

                onTap: () {},
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

                onTap: () {},
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
                onTap: () {},
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
