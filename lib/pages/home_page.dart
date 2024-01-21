import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dvmastrsn/controller/ApiConnector.dart';
import 'package:dvmastrsn/widgets/appBarDv.dart';
import 'package:dvmastrsn/widgets/bottomNavBar.dart';
import 'package:dvmastrsn/widgets/drawerDv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Naryad.dart';
import '../ui.dart';
import 'naryad_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // // final Controller _controller = Get.find();
  // late List<bool> _rows;
  // final _api = ApiConnector();
  // late List<Naryad> _listNaryad = [];
  // // final GlobalKey<ScaffoldState> _key = GlobalKey();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEnableOpenDragGesture: true,
      // key: _key,
      backgroundColor: Ui.backColorFrom,
      appBar: AppBarDv(),
      drawer: DrawerDv(),
      body: NaryadPage(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
