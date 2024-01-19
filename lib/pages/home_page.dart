import 'package:dvmastrsn/controller/ApiConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Naryad.dart';
import '../ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final Controller _controller = Get.find();
  late List<bool> _rows;
  final _api = ApiConnector();
  late List<Naryad> _listNaryad = [];

  @override
  void initState() {
    super.initState();
    _rows = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Ui.backColorFrom,
        body: FutureBuilder(
            future: _api.getall("dv_test/hs/mobile/zakaz/", "DVБП-00175"),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var json = snapshot.data!;
                _listNaryad = json.map((e) => Naryad.fromJson(e)).toList();
                if(_rows.isEmpty){
                  _rows = new List.generate(_listNaryad.length, (index) => false);
                }
                return ListView.builder(
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
                                  ? 140
                                  : 140 + (_listNaryad[index].items!.length * 55),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                            color:  _listNaryad[index].status! =="Закрыт"?Colors.blueAccent: Ui.backColorTo1,
                                            // border:
                                            //     Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          _listNaryad[index].status!,
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                          child: Text('Автомобиль: ',
                                              style: TextStyle(
                                                color: Ui.backColorTo1,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
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
                                                fontWeight: FontWeight.normal,
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
                                                    alignment: Alignment.center,
                                                    // width: MediaQuery.of(context).size.width / 3,
                                                    child: Text(
                                                      "Услуга",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ))),
                                            DataColumn(
                                                label: Container(
                                                    alignment: Alignment.center,
                                                    // width: ,
                                                    child: Text(
                                                      "Кол-во",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ))),
                                            DataColumn(
                                                label: Container(
                                                    alignment: Alignment.center,
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
                                              style: TextStyle(fontSize: 10),
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
                                                  alignment: Alignment.center,
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
                    });
              }
            }));
  }
}
