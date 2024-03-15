import 'package:dvmastrsn/models/Automobile.dart';
import 'package:dvmastrsn/models/Login.dart';
import 'package:dvmastrsn/models/Naryad.dart';
import 'package:dvmastrsn/models/Virabotka.dart';
import 'package:dvmastrsn/pages/presale_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Peredprodajka.dart';
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
  var listAutomobile = <Automobile>[].obs;
  var listAutomobileForSend = <Automobile>[].obs;
  var progres = false.obs;
  var progresSent = false.obs;

  var page = 0.obs;



  @override
  onInit() {
    super.onInit();

    this.page.value = 0;
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

  void changeListlistAutomobileForSend(Automobile automobile){
    this.listAutomobileForSend.value.add(automobile);
    update();
  }

  Future<Login> enterlogin(String tabel, String pass) async {
    final json = await api.getLogin(Ui.urllogin, tabel, pass);

    return Login.fromJson(json);
  }

  Future<List<Automobile>> getListAutomobile(String vin) async {
    final json = await api.getAuto(Ui.urlauto, vin);
    return json.map((e) => Automobile.fromJson(e)).toList();
  }

  Future<bool> sentPeredprodajka(Peredprodajka peredprodajka) async {
    return await api.sentPeredprodajka(Ui.urlsentPereprodajka, peredprodajka);
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
      case 3:
        return PreSalePage();
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
