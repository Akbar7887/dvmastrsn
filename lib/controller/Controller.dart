import 'package:dvmastrsn/models/AutoService.dart';
import 'package:dvmastrsn/models/Login.dart';
import 'package:dvmastrsn/models/Naryad.dart';
import 'package:dvmastrsn/models/Virabotka.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/naryad_page.dart';
import '../pages/service_page.dart';
import '../pages/virabotka_page.dart';
import '../ui.dart';
import 'ApiConnector.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  var listNaryad = <Naryad>[].obs;
  var listVirabotka = <Virabotka>[].obs;
  var login = Login().obs;

  // var listAutoService = <AutoService>[].obs;
  var page = 0.obs;
  var fio = "".obs;

  // var tabel = "".obs;

  // var pageService = 0.obs;

  @override
  onInit() {
    super.onInit();

    this.page.value = 0;
    // this.tabel.value = "DVБП-00175";
    // fetchListNyad("DVБП-00183");
    this.page.value = 0;
    this.fio.value = "Toshmat EFGREG ergvREGV";
    // fetchListAutoService("0");
  }

  fetchListNyad(String id, String date) async {
    final json = await api.getall(Ui.urlzakaz, this.login.value.tabel!, date);
    this.listNaryad.value = json.map((e) => Naryad.fromJson(e)).toList();
    // listKompleks.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

  fetchListVirabotka() async {
    final json = await api.getall(Ui.urlvirabotka, this.login.value.tabel!, "");
    this.listVirabotka.value = json.map((e) => Virabotka.fromJson(e)).toList();
  }

  changePage(int page) {
    this.page.value = page;
    update();
  }

 Future<Login> enterlogin(String tabel, String pass) async {
    final json = await api.getLogin(Ui.urllogin, tabel, pass);

    return Login.fromJson(json);
  }

  selectPage() {
    switch (this.page.value) {
      case 0:
        return NaryadPage();
        break;
      case 1:
        return VirabotkaPage();
        break;
      case 2:
        return ServicePage();
        break;
      default:
        return Center(child: CircularProgressIndicator());
    }
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
