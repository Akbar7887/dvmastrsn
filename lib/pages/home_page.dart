import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/Controller.dart';
import '../ui.dart';

final Controller _controller = Get.find();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.fetchListNyad("DVБП-00183");

    return Obx(() => Scaffold(
        backgroundColor: Ui.backColor,
        body: ListView.builder(
            itemCount: _controller.listNaryad.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[200],
                      // border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                          child: Row(
                        children: [
                          Container(
                            child: Text(
                              "№",
                              style: TextStyle(
                                  color: Ui.backColor[200], fontSize: 18),
                            ),
                          ),
                          Container(
                              child: Text(
                            ' ${_controller.listNaryad[index].nomer!} от ${_controller.listNaryad[index].date}',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                        ],
                      )),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Автомобиль: ',
                                  style: TextStyle(
                                    color: Ui.backColor[200],
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  )),
                              alignment: Alignment.bottomLeft,
                            ),
                            Expanded(
                                child: Text(
                              _controller.listNaryad[index].auto!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.justify,
                            ))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Сумма: ',
                                  style: TextStyle(
                                    color: Ui.backColor[200],
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  )),
                              alignment: Alignment.bottomLeft,
                            ),
                            Expanded(
                                child: Text(
                              _controller.listNaryad[index].amount!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ))
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: ListView(
                          children:
                              _controller.listNaryad[index].items!.map((e) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Container(
                                child: Text(
                                  e.service!,
                                  style: TextStyle(color: Colors.white),
                                ),
                                width: MediaQuery.of(context).size.width/2,
                              ),
                              Container(
                                child: Text(
                                  e.quantity!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],);
                          }).toList(),
                        ),
                      )
                    ],
                  ));
            })));
  }
}
