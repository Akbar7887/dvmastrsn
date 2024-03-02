import 'package:dvmastrsn/controller/Controller.dart';
import 'package:dvmastrsn/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController _seachController = TextEditingController();
final Controller _controller = Get.put(Controller());

class PreSalePage extends StatelessWidget {
  const PreSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Авто услуга: ",
                      style: TextStyle(color: Colors.white38)),
                  TextSpan(text: _controller.login.value.service)
                ]))),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                        height: 80,
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: Ui.fontPlaybold),
                          cursorColor: Colors.white,
                          controller: _seachController,
                          decoration: InputDecoration(
                              hintText: "Вин 6 цифр",
                              labelText: "Вин 6 цифр",
                              // label: Text("Вин 6 цифр"),
                              labelStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white,
                              hintStyle: TextStyle(color: Colors.white38),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white))),
                        ))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Ui.backColorFrom,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  side: BorderSide(color: Colors.white))),
                          onPressed: () {
                            if (_seachController.text.isEmpty) {
                              _controller.progres.value = false;
                              return;
                            }
                            if (_seachController.text.length < 6) return;
                            _controller.progres.value = true;
                            _controller
                                .getListAutomobile(_seachController.text)
                                .then((value) {
                              _controller.progres.value = false;
                              _controller.listAutomobile.value = value;
                              if (value.length == 1) {
                                var _result = _controller
                                    .listAutomobileForSend.value
                                    .where((element) =>
                                        element.vin!.contains(value[0].vin!))
                                    .toList();
                                if (_result.length == 0) {
                                  _controller.changeListlistAutomobileForSend(
                                      value[0]!);
                                }
                              }
                            });
                          },
                          child: _controller.progres.value == false
                              ? Text(
                                  "Найти",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )
                              : CircularProgressIndicator(),
                        )))
              ],
            )),
            SizedBox(
              height: 10,
            ),
            _controller.listAutomobile.value.length != 0
                ? Container(
                    height: 50.0 * _controller.listAutomobile.value.length,
                    child: ListView.builder(
                        itemCount: _controller.listAutomobile.value.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white38,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    side: BorderSide(color: Colors.white))),
                            child: Text(
                              _controller.listAutomobile.value[index].vin
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: Ui.fontMontserrat,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              var _result = _controller
                                  .listAutomobileForSend.value
                                  .where((element) => element.vin!.contains(
                                      _controller
                                          .listAutomobile.value[index].vin!))
                                  .toList();
                              if (_result.length == 0) {
                                _controller.changeListlistAutomobileForSend(
                                    _controller.listAutomobile.value[index]);
                              }
                              _controller.listAutomobileForSend.refresh();
                            },
                          );
                        }))
                : SizedBox(),
            Divider(
              color: Colors.white38,
            ),
            Expanded(
                child: ListView(
                    children:
                        _controller.listAutomobileForSend.value.map((element) {
              return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38,
                      border: Border.all(color: Colors.white)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          element.vin.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: Ui.fontMontserrat,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                              width: 120,
                              child: Text(
                                element.model.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: Ui.fontMontserrat,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: 40,
                              child: Text(
                                element.color.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: Ui.fontMontserrat,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ))
                    ],
                  ));
            }).toList())),
            Container(
                margin: EdgeInsets.all(10),
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        side: BorderSide(color: Colors.white, width: 0.5)),
                  ),
                  onPressed: () {
                    // _controller.listAutomobileForSend.value.clear();
                    // _controller.listAutomobile.value.clear();

                  },
                  child: Text(
                    "Закрыть документ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ))
          ],
        )));
  }
}
