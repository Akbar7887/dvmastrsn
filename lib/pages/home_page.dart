import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/Controller.dart';
import '../ui.dart';

final Controller controller = Get.find();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.fetchListNyad("DVБП-00183");

    return Obx(() => Scaffold(
        backgroundColor: Ui.backColor,
        body: ListView.builder(
            itemCount: controller.listNaryad.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      // border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          '№ ${controller.listNaryad[index].nomer!} от ${controller.listNaryad[index].date}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'Автомобиль',
                            children: [
                              TextSpan(
                                  text: controller.listNaryad[index].auto!)
                            ],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ));
            })));
  }
}
