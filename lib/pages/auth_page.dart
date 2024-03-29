import 'package:dvmastrsn/controller/Controller.dart';
import 'package:dvmastrsn/pages/home_page.dart';
import 'package:dvmastrsn/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();
  final Controller _controller = Get.put(Controller());
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;
  bool showProgres = false;

  @override
  void initState() {
    super.initState();
    defaultPinTheme = PinTheme(
      width: 40,
      height: 50,
      textStyle: TextStyle(
          fontSize: 25,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  }

  void _enterAction(BuildContext context) {
    _controller.enterlogin(_login.text, _password.text).then((value) {
      showProgres = false;

      _controller.login.value = value;
      if (_controller.login.value.tabel!.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }).onError((error, stackTrace) {
      setState(() {
        showProgres = false;
      });
      const snackBar = SnackBar(
        content: Text(
          'Логин или пароль не верно !',
          style: TextStyle(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Create FocusNode
    final pinputFocusNode = FocusNode();
    pinputFocusNode.requestFocus();
    pinputFocusNode.unfocus();

    return Scaffold(
        backgroundColor: Ui.backColorFrom,
        body: SafeArea(
            child: Material(
          textStyle:
              TextStyle(fontFamily: Ui.fontMontserrat, color: Colors.white),
          child: Container(
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
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "Вход",
                      style: TextStyle(
                          fontSize: 40, fontFamily: Ui.fontMontserrat),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Табель",
                      style: TextStyle(),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Pinput(
                        controller: _login,
                        length: 5,
                        // focusNode: pinputFocusNode,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        // validator: (s) {
                        //   return s == '22222' ? null : 'Pin is incorrect';
                        // },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Пароль",
                      style: TextStyle(),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Pinput(
                        controller: _password,
                        length: 5,
                        obscuringCharacter: "*",
                        obscureText: true,
                        obscuringWidget: const Icon(
                          Icons.circle,
                          size: 20,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        // focusNode: pinputFocusNode,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        // validator: (s) {
                        //   return s == '22222' ? null : 'Pin is incorrect';
                        // },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      )),
                  Container(
                    height: 80,
                    width: 200,
                    padding: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Ui.backColorFrom,

                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: Ui.fontMontserrat,
                                fontWeight: FontWeight.bold),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide(color: Colors.white, width: 0.5)),),
                        onPressed: () {
                          setState(() {
                            showProgres = true;
                          });
                          _enterAction(context);
                        },
                        child: showProgres == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Ui.backColorTo0,
                                ),
                              )
                            : Container(child: Text("Войти"))),
                  )
                ],
              )),
        )));
  }
}
