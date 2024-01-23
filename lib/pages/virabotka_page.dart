import 'package:dvmastrsn/controller/ApiConnector.dart';
import 'package:dvmastrsn/controller/Controller.dart';
import 'package:dvmastrsn/models/PoDnyam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Virabotka.dart';
import '../ui.dart';

class VirabotkaPage extends StatefulWidget {
  const VirabotkaPage({Key? key}) : super(key: key);

  @override
  State<VirabotkaPage> createState() => _VirabotkaPageState();
}

class _VirabotkaPageState extends State<VirabotkaPage> {
  final Controller _controller = Get.find();
  ApiConnector _apiConnector = ApiConnector();
  late List<Virabotka> _listVirabotka;
  List<PoDnyam> _listPoDnyam = [];
  late String _date;
  late List<bool> _listSelected;

  @override
  void initState() {
    super.initState();
    _listVirabotka = [];
    _listSelected = [];
    _date = '';
  }

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
              height: 15,
            ),
            Container(
                child: RichText(
              text: TextSpan(
                  text: 'Выработка: ',
                  style: TextStyle(
                      color: Ui.backColorTo1,
                      fontFamily: Ui.fontMontserrat,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: _controller.fio.value,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Ui.fontMontserrat,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ]),
            )),
            Divider(),
            Container(
                height: 50 +
                    (_listVirabotka.length == 0
                        ? 1
                        : _listVirabotka.length * 35),
                child: FutureBuilder(
                  future: _apiConnector.getall(
                      Ui.urlvirabotka, _controller.tabel.value, ""),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var json = snapshot.data!;
                      _listVirabotka =
                          json.map((e) => Virabotka.fromJson(e)).toList();
                      _listSelected = List.generate(
                          _listVirabotka.length, (index) => false);
                      if (_listVirabotka.isNotEmpty && _date.isEmpty) {
                        _date = _listVirabotka.first.datef!;
                      }
                      return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                sortColumnIndex: 0,
                                showCheckboxColumn: false,
                                dataRowHeight: 40,
                                headingRowHeight: 40,
                                // headingRowColor: MaterialStateColor.resolveWith(
                                //     (states) => Colors.transparent),
                                headingTextStyle:
                                    TextStyle(color: Ui.backColorTo1),
                                // dataRowColor: MaterialStateColor.resolveWith(
                                //     (states) => Ui.backColorTo1),

                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(35),
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
                                  // borderRadius: BorderRadius.circular(35),
                                ),
                                dataTextStyle: TextStyle(color: Colors.white),
                                columnSpacing: 12,
                                columns: [
                                  DataColumn(
                                      label: Container(
                                          alignment: Alignment.center,
                                          // width: 20,
                                          child: Text(
                                            "Месяц",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Ui.fontMontserrat,
                                                color: Colors.white),
                                          ))),
                                  DataColumn(
                                      label: Container(
                                          alignment: Alignment.center,
                                          // width: 20,
                                          child: Text(
                                            "Выручка",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Ui.fontMontserrat,
                                                color: Colors.white),
                                          ))),
                                  DataColumn(
                                      label: Container(
                                          alignment: Alignment.center,
                                          // width: 20,
                                          child: Text(
                                            "Проц.",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Ui.fontMontserrat,
                                                color: Colors.white),
                                          ))),
                                  DataColumn(
                                      label: Container(
                                          alignment: Alignment.center,
                                          // width: 20,
                                          child: Text(
                                            "Выработка",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Ui.fontMontserrat,
                                                color: Colors.white),
                                          ))),
                                  DataColumn(
                                    label: Container(
                                        alignment: Alignment.center,
                                        // width: 20,
                                        child: Text(
                                          "Получил",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: Ui.fontMontserrat,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                                rows: _listVirabotka.map((e) {
                                  return DataRow(
                                      selected: _listSelected[
                                          _listVirabotka.indexOf(e)],
                                      onSelectChanged: (selected) {
                                        setState(() {
                                          if (selected!) {
                                            _listSelected[_listVirabotka
                                                .indexOf(e)] = selected;
                                            _date = e.datef!;
                                          }
                                        });
                                      },
                                      cells: [
                                        DataCell(
                                          Text(
                                            e.date!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontFamily: Ui.fontMontserrat,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            e.revenue!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: Ui.fontMontserrat,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            '${e.procent!} %',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: Ui.fontMontserrat,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            e.fakt!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: Ui.fontMontserrat,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(Checkbox(
                                          fillColor: MaterialStateProperty.all(
                                              Ui.backColorFrom),
                                          checkColor: Colors.white,
                                          value: e.received,
                                          onChanged: (bool? value) {},
                                        )),
                                      ]);
                                }).toList(),
                              )));
                    }
                  },
                )),
            Divider(),
            Container(
              child: Text(
                "Список по дням",
                style: TextStyle(
                    fontFamily: Ui.fontMontserrat, color: Colors.white),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: _apiConnector.getall(
                  "dv_test/hs/mobile/virabotkapodnyam/",
                  _controller.tabel.value,
                  _date),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var json = snapshot.data!;
                  _listPoDnyam = json.map((e) => PoDnyam.fromJson(e)).toList();
                  return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              sortColumnIndex: 0,
                              dataRowHeight: 30,
                              headingTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: Ui.fontMontserrat),
                              headingRowHeight: 30,
                              columns: [
                                DataColumn(label: Text("День")),
                                DataColumn(label: Text("Выручка"))
                              ],
                              rows: _listPoDnyam.map((e) {
                                return DataRow(cells: [
                                  DataCell(
                                    Text(
                                      e.date!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: Ui.fontMontserrat,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      e.dept!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: Ui.fontMontserrat,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]);
                              }).toList())));
                }
              },
            ))
          ],
        ));
  }
}
