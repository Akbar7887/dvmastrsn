import 'dart:convert';

import 'package:dvmastrsn/controller/ApiConnector.dart';
import 'package:dvmastrsn/controller/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/AutoService.dart';
import '../ui.dart';

ScrollController _scrollController = ScrollController();
final Controller _controller = Get.put(Controller());

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);



  void pagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // setState(() {
      // isLoading = true;
      _controller.incrementPageService();
      //add api for load the more data according to new page
      _controller
          .fetchListAutoService(_controller.pageService.value.toString());

      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(pagination);

    return ListView.builder(
        controller: _scrollController,
        itemCount: _controller.listAutoService.length,
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
              '${_controller.listAutoService[idx].name!} - ${_controller.listAutoService[idx].rownumber}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: Ui.fontMontserrat,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
