import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/Controller.dart';
import '../ui.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller _controller = Get.find();
  late List<bool> _rows = [];


  @override
  void initState() {
    super.initState();
    _rows = new List.generate(_controller.listNaryad.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Ui.backColor,
        body: ListView.builder(
            itemCount: _controller.listNaryad.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: (){
                    setState(() {
                      _rows[index] = !_rows[index];
                    });
                  },
                  child: Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: !_rows[index]
                      ? 130
                      : 100 +
                          (_controller.listNaryad[index].items!.length * 55),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent[200],
                      // border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      Divider(),
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
                      !_rows[index]
                          ? Container()
                          : Expanded(
                              child: DataTable(
                              border: TableBorder.all(
                                width: 0.5,
                              ),
                              headingRowHeight: 20,
                              headingRowColor:
                                  MaterialStateProperty.all(Colors.orange),
                              columnSpacing: 10,
                              headingTextStyle: TextStyle(
                                  fontFamily: Ui.fontPlay, color: Colors.black),
                              columns: [
                                DataColumn(
                                    label: Container(
                                        alignment: Alignment.center,
                                        // width: MediaQuery.of(context).size.width / 3,
                                        child: Text(
                                          "Услуга",
                                          style: TextStyle(fontSize: 10),
                                        ))),
                                DataColumn(
                                    label: Container(
                                        alignment: Alignment.center,
                                        // width: ,
                                        child: Text(
                                          "Кол-во",
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
                                        // width: 20,
                                        child: Text(
                                  "Сумма",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                ))),
                              ],
                              rows:
                                  _controller.listNaryad[index].items!.map((e) {
                                return DataRow(cells: [
                                  DataCell(
                                    Text(
                                      e.service!,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  DataCell(Container(
                                    child: Text(
                                      e.quantity!,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    alignment: Alignment.center,
                                  )),
                                  DataCell(
                                    Container(
                                      child: Text(
                                        e.procent!,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  DataCell(Container(
                                    child: Text(
                                      e.amount!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    alignment: Alignment.centerRight,
                                  ))
                                ]);
                              }).toList(),
                            )),
                    ],
                  )));
            })));
  }
}
