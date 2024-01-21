import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../ui.dart';

int currentindex = 0;

Widget BottomNavBar() {
  return ConvexAppBar(
    height: 70,
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
    ),
    initialActiveIndex: currentindex,
    // color: Colors.white,
    backgroundColor: Ui.backColorFrom,
    activeColor: Ui.backColorFrom,
    curveSize: 20,
    // cornerRadius: 1,
    items: [
      TabItem(
        icon: Icon(
          Icons.car_repair,
          color: Colors.white,
          size: 25,
        ),
        title: "З-Наряд",
        // activeIcon: Icon(
        //   Icons.car_repair,
        //   color: Ui.backColorFrom,
        //   size: 30,
        // ),
      ),
      TabItem(
        icon: Icon(
          Icons.currency_exchange,
          color: Colors.white,
        ),
        title: "Вырабока",
        // activeIcon: Icon(
        //   Icons.car_repair,
        //   color: Ui.backColorFrom,
        //   size: 30,
        // ),
      ),
      TabItem(
        icon: Icon(
          Icons.miscellaneous_services,
          color: Colors.white,
        ),
        title: "Услуги",
        // activeIcon: Icon(
        //   Icons.miscellaneous_services,
        //   color: Ui.backColorFrom,
        //   size: 30,
        // ),
      ),
      TabItem(
        icon: Icon(
          Icons.exit_to_app_sharp,
          color: Colors.white,
        ),
        title: "Выход",
        // activeIcon: Icon(
        //   Icons.exit_to_app_sharp,
        //   color: Ui.backColorFrom,
        //   size: 30,
        // ),
      ),
    ],
    onTap: (int index) {
      if (index == 0) {
        // context.read<SectionProvider>().changeSection(null);
        // context.read<SimpleProvider>().changepage(1);
      } else if (index == 1) {
        // context.read<SimpleProvider>().changepage(6);
      } else if (index == 2) {
        // context.read<SimpleProvider>().changepage(9);
      } else if (index == 3) {
        // context.read<SimpleProvider>().changepage(5);
      }

      currentindex = index;
    },
  );
}
