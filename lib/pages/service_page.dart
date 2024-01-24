import 'dart:convert';

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
  ApiConnector _apiConnector = ApiConnector();
  List<AutoService> _listAutoService = [];
  ScrollController _scrollController = ScrollController();
  int _page = 0;

  @override
  void initState() {
    _scrollController.addListener(pagination);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<dynamic>> _getAllByName() async {
    return await _apiConnector.getallByName(Ui.urlservice, "&&&", _page);
  }

  void pagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        // isLoading = true;
        _page += 1;
        _getAllByName();
        //add api for load the more data according to new page
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAllByName(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var json = snapshot.data!;
            _listAutoService
                .addAll(json.map((e) => AutoService.fromJson(e)).toList());
            // _listAutoService.removeWhere((element) => element.rownumber== element.rownumber);
            return ListView.builder(
                controller: _scrollController,
                itemCount: _listAutoService.length,
                itemBuilder: (context, idx) {
                  return Container(
                    margin: EdgeInsets.all(5),
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
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${_listAutoService[idx].name!} - ${_listAutoService[idx].rownumber}',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Ui.fontMontserrat,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                });
          }
        });
  }
}
