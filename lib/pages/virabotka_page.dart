import 'package:dvmastrsn/controller/ApiConnector.dart';
import 'package:dvmastrsn/controller/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Virabotka.dart';
import '../ui.dart';

final Controller _controller = Get.find();
ApiConnector _apiConnector = ApiConnector();
List<Virabotka> _listVirabotka = [];

class VirabotkaPage extends StatelessWidget {
  const VirabotkaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
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
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                _controller.fio.value,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: Ui.fontMontserrat,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Expanded(
                child: FutureBuilder(
              future: _apiConnector.getall(Ui.urlvirabotka, ""),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var json = snapshot.data!;
                  _listVirabotka =
                      json.map((e) => Virabotka.fromJson(e)).toList();

                  return DataTable(
                    border: TableBorder.all(
                      width: 0.5,
                    ),
                    headingRowHeight: 20,
                    headingRowColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    columnSpacing: 10,
                    headingTextStyle:
                        TextStyle(fontFamily: Ui.fontPlay, color: Colors.black),
                    columns: [
                      DataColumn(
                          label: Container(
                              alignment: Alignment.center,
                              // width: 20,
                              child: Text(
                                "Месяц",
                                style: TextStyle(fontSize: 10),
                              ))),
                      DataColumn(
                          label: Container(
                              alignment: Alignment.center,
                              // width: 20,
                              child: Text(
                                "Выручка",
                                style: TextStyle(fontSize: 10),
                              ))),
                      DataColumn(
                          label: Container(
                              alignment: Alignment.center,
                              // width: 20,
                              child: Text(
                                "Проц.",
                                style: TextStyle(fontSize: 10),
                              ))),
                      DataColumn(
                          label: Container(
                              alignment: Alignment.center,
                              // width: 20,
                              child: Text(
                                "Выработка",
                                style: TextStyle(fontSize: 10),
                              ))),
                      DataColumn(
                          label: Container(
                              alignment: Alignment.center,
                              // width: 20,
                              child: Text(
                                "Получил",
                                style: TextStyle(fontSize: 10),
                              ))),
                    ],
                    rows: _listVirabotka.map((e) {
                      return DataRow(cells: [
                        DataCell(
                          Text(
                            e.date!,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        DataCell(
                          Text(
                            e.revenue!,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        DataCell(
                          Text(
                            e.procent!,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        DataCell(
                          Text(
                            e.fakt!,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        DataCell(Checkbox(
                          value: e.received,
                          onChanged: (bool? value) {},
                        )),
                      ]);
                    }).toList(),
                  );
                }
              },
            ))
          ],
        ));
  }
}
