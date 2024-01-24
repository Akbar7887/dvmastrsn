import 'package:dvmastrsn/controller/ApiConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/AutoService.dart';
import '../ui.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  ScrollController _scrollController = ScrollController();
  ApiConnector _apiConnector = ApiConnector();
  late List<AutoService> _listAutoService;
  late int _page;
  List<bool> _listShow = [];
  TextEditingController _textSeach = TextEditingController();

  @override
  void initState() {
    _scrollController.addListener(pagination);
    _listAutoService = [];
    _page = 0;
    getAll();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void pagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // _controller.incrementPageService();
      setState(() {
        _page += 1;
        getAll();
      });
    }
  }

  Future<List<AutoService>> getAll() async {
    String _sendText = "&&&";
    if (_textSeach.text.isNotEmpty) {
      _sendText = _textSeach.text;
    }
    var json = await _apiConnector.getallByName(
        Ui.urlservice, _sendText, _page.toString());
    List<AutoService> _list = json.map((e) => AutoService.fromJson(e)).toList();
    for (int i = 0; i < _list.length; i++) {
      bool exist = _listAutoService
          .where((element) => element.rownumber == _list[i].rownumber)
          .isEmpty;
      if (exist || _listAutoService.length == 0) {
        _listAutoService.add(_list[i]);
      }
    }

    if (_listShow.length != _listAutoService.length) {
      _listShow = List.generate(_listAutoService.length, (index) => false);
    }
    return _listAutoService;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Ui.backColorTo1, width: 0.5),
            borderRadius: BorderRadius.circular(10),
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
            // shape: BoxShape.rectangle,
          ),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            controller: _textSeach,
            cursorColor: Colors.white,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            onEditingComplete: () {
              setState(() {
                _listAutoService.clear();
                getAll();
              });
            },
          ),
        ),
        Expanded(
            child: FutureBuilder(
                future: getAll(),
                builder: (cotext, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    _listAutoService = snapshot.data!;
                    return ListView.builder(
                        controller: _scrollController,
                        itemCount: _listAutoService.length,
                        itemBuilder: (context, idx) {
                          return Container(
                              //height:
                              //  80 + (_listAutoService[idx].itemservice!.length * 40),
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _listShow[idx] = !_listShow[idx];
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      height: 60,
                                      decoration: BoxDecoration(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.white, width: 0.5)),
                                      padding: EdgeInsets.all(10),
                                      child: Row(children: [
                                        Container(
                                            child: Text(
                                          '№ ${_listAutoService[idx].rownumber}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Ui.backColorTo0,
                                              fontFamily: Ui.fontMontserrat,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        VerticalDivider(
                                          color: Ui.backColorTo0,
                                        ),
                                        Expanded(
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  '${_listAutoService[idx].name!}',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          Ui.fontMontserrat,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )))
                                      ]))),
                              _listShow[idx]
                                  ? Container(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 30),
                                      height: _listAutoService[idx]
                                              .itemservice!
                                              .length *
                                          40,
                                      child: ListView.builder(
                                          itemCount: _listAutoService[idx]
                                              .itemservice!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        _listAutoService[idx]
                                                            .itemservice![index]
                                                            .model!,
                                                        style: TextStyle(
                                                            fontFamily: Ui
                                                                .fontMontserrat,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      Expanded(
                                                          child: Text(
                                                        _listAutoService[idx]
                                                            .itemservice![index]
                                                            .price
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontFamily: Ui
                                                                .fontMontserrat,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                                Divider()
                                              ],
                                            ));
                                          }))
                                  : SizedBox()
                            ],
                          ));
                        });
                  }
                }))
      ],
    );
  }
}
