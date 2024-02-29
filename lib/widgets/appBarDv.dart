import 'package:dvmastrsn/controller/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui.dart';

final Controller _controller = Get.put(Controller());

class AppBarDv extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDv({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Ui.companyName,
              style: TextStyle(
                  fontFamily: Ui.fontMontserrat,
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _controller.login.value.name!,
              style: TextStyle(
                  fontFamily: Ui.fontMontserrat,
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.2, 1),
                colors: <Color>[
                  Ui.backColorFrom,
                  Ui.backColorTo2,
                  Ui.backColorTo1,
                  // Ui.backColorTo0,
                ],
                // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              )),
          // padding: EdgeInsets.only(top: 65, left: 65),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // getTitle()!,
          //     SizedBox(
          //       width: 5,
          //     ),
          //     Container(
          //       child: Text(
          //         "${Ui.companyName}",
          //         style: TextStyle(
          //             fontFamily: Ui.fontMontserrat,
          //             fontWeight: FontWeight.w500,
          //             fontSize: 20),
          //       ),
          //     ),
          //   ],
          // ),
        ),
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))));
  }
}
