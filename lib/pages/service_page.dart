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
  late List<AutoService> _listAutoService;

  @override
  void initState() {
    super.initState();
    _listAutoService = [];
  }

  Future<List<dynamic>> getAllByName() async {
    return await _apiConnector.getallByName(Ui.urlservice, "&&&");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllByName(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var json = snapshot.data!;
            _listAutoService =
                json.map((e) => AutoService.fromJson(e)).toList();

            return ListView.builder(
                itemCount: _listAutoService.length,
                itemBuilder: (context, idx) {
                  return Container(
                    child: Text(_listAutoService[idx].name!),
                  );
                });
          }
        });
  }
}
