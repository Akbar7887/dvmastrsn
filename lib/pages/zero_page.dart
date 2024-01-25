import 'package:dvmastrsn/pages/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/initservices.dart';
import '../ui.dart';
import 'home_page.dart';

double opacityLevel = 1.0;
bool k = true;

class ZeroPage extends StatefulWidget {
  const ZeroPage({Key? key}) : super(key: key);

  @override
  State<ZeroPage> createState() => _ZeroPageState();
}

class _ZeroPageState extends State<ZeroPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getHomePage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return Scaffold(
              // backgroundColor: Colors.indigo,
              body: Container(
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
                    )),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  Ui.companyName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: Ui.fontMontserrat,
                      color: Colors.white,
                      ),
                ),
              ),
            );
          }
        });
  }

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  Future<Widget> getHomePage() async {
    _changeOpacity();
    await initServices();

    return await Future.delayed(Duration(seconds: 2), () async {})
        .then((value) => AuthPage());
  }
}
