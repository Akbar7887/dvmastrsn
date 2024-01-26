import 'package:dvmastrsn/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/ApiConnector.dart';
import '../models/Naryad.dart';
import '../ui.dart';

class NaryadPage extends StatefulWidget {
  const NaryadPage({Key? key}) : super(key: key);

  @override
  State<NaryadPage> createState() => _NaryadPageState();
}

class _NaryadPageState extends State<NaryadPage> {
  late List<bool> _rows;
  final _api = ApiConnector();
  late List<Naryad> _listNaryad;
  late String _date;
  late String _datapicker;
  final Controller _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _rows = [];
    _listNaryad = [];
    var _year = DateTime.now().year;
    var _moth = DateTime.now().month;
    _date = DateFormat('yyyyMMdd').format(DateTime(_year, _moth, 01));
    _datapicker = DateFormat('dd MMMM yyyy').format(DateTime.now());
  }

  Future ShowDatePicker() async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
  }

  Future<List<dynamic>> _getAll() async {
    return await _api.getall(
        Ui.urlzakaz, _controller.login.value.tabel!, _date);
  }

  // DateFormat('yyyyMMdd').format(DateTime.now())
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Ui.backColorFrom)),
              child: Text(_datapicker, style: TextStyle(color: Colors.white)),
              // keyboardType: TextInputType.datetime,
              onPressed: () async {
                ShowDatePicker().then((date) {
                  setState(() {
                    _date = DateFormat('yyyyMMdd').format(date);
                    _datapicker = DateFormat('dd MMMM yyyy').format(date);
                    _getAll();
                    // _api
                    //     .getall(
                    //         "dv_test/hs/mobile/zakaz/",
                    //         "DVБП-00175",
                    //         DateFormat('yyyyMMdd').format(date))
                    //     .then((value) {
                    //   this._listNaryad =
                    //       value.map((e) => Naryad.fromJson(e)).toList();
                    // });
                  });
                });
              },
            )),
        FutureBuilder(
            future: _getAll(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Expanded(child: Center(
                  child: CircularProgressIndicator(color: Ui.backColorTo1,),
                ));
              } else {
                var json = snapshot.data!;
                _listNaryad = json.map((e) => Naryad.fromJson(e)).toList();
                if (_rows.isEmpty) {
                  _rows =
                      new List.generate(_listNaryad.length, (index) => false);
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: _listNaryad.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  _rows[index] = !_rows[index];
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width,
                                  height: !_rows[index]
                                      ? MediaQuery.of(context).size.height / 4.5
                                      : 140 +
                                          (_listNaryad[index].items!.length *
                                              55),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 0.5),
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
                                      // border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  ' ${_listNaryad[index].nomer!}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  ' ${_listNaryad[index].date}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                          )),
                                          Spacer(),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: _listNaryad[index]
                                                            .status! ==
                                                        "Закрыт"
                                                    ? Colors.blueAccent
                                                    : Ui.backColorTo1,
                                                // border:
                                                //     Border.all(color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              _listNaryad[index].status!,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      )),
                                      Divider(),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text('Авто: ',
                                                  style: TextStyle(
                                                    color: Ui.backColorTo1,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  )),
                                              alignment: Alignment.bottomLeft,
                                            ),
                                            Expanded(
                                                child: Text(
                                              _listNaryad[index].auto!,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text('Сумма: ',
                                                  style: TextStyle(
                                                    color: Ui.backColorTo1,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  )),
                                              alignment: Alignment.bottomLeft,
                                            ),
                                            Expanded(
                                                child: Text(
                                              '${_listNaryad[index].amount!} сум',
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
                                                  MaterialStateProperty.all(
                                                      Colors.blueAccent),
                                              columnSpacing: 10,
                                              headingTextStyle: TextStyle(
                                                  fontFamily: Ui.fontPlay,
                                                  color: Colors.black),
                                              columns: [
                                                DataColumn(
                                                    label: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        // width: MediaQuery.of(context).size.width / 3,
                                                        child: Text(
                                                          "Услуга",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ))),
                                                DataColumn(
                                                    label: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        // width: ,
                                                        child: Text(
                                                          "Кол-во",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ))),
                                                DataColumn(
                                                    label: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        // width: 20,
                                                        child: Text(
                                                          "Проц.",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ))),
                                                DataColumn(
                                                    label: Container(
                                                        // width: 20,
                                                        child: Text(
                                                  "Сумма",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ))),
                                              ],
                                              rows: _listNaryad[index]
                                                  .items!
                                                  .map((e) {
                                                return DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      e.service!,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                  DataCell(Container(
                                                    child: Text(
                                                      e.quantity!,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                    alignment: Alignment.center,
                                                  )),
                                                  DataCell(
                                                    Container(
                                                      child: Text(
                                                        e.procent!,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ),
                                                  DataCell(Container(
                                                    child: Text(
                                                      e.amount!,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                  ))
                                                ]);
                                              }).toList(),
                                            )),
                                    ],
                                  )));
                        }));
              }
            })
      ],
    );
  }
}
