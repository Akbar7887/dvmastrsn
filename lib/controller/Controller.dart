import 'package:dvmastrsn/models/AutoService.dart';
import 'package:dvmastrsn/models/Naryad.dart';
import 'package:dvmastrsn/models/Virabotka.dart';
import 'package:get/get.dart';

import '../ui.dart';
import 'ApiConnector.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  var listNaryad = <Naryad>[].obs;
  var listVirabotka = <Virabotka>[].obs;
  // var listAutoService = <AutoService>[].obs;
  var page = 0.obs;
  var fio = "".obs;
  var tabel = "".obs;
  // var pageService = 0.obs;

  @override
  onInit() {
    super.onInit();

    this.page.value = 0;
    this.tabel.value = "DVБП-00175";
    // fetchListNyad("DVБП-00183");
    this.page.value = 2;
    this.fio.value = "Toshmat EFGREG ergvREGV";
    // fetchListAutoService("0");

  }

  fetchListNyad(String id, String date) async {
    final json = await api.getall(Ui.urlzakaz, this.tabel.value, date);
    this.listNaryad.value = json.map((e) => Naryad.fromJson(e)).toList();
    // listKompleks.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

  fetchListVirabotka() async {
    final json = await api.getall(Ui.urlvirabotka, this.tabel.value, "");
    this.listVirabotka.value = json.map((e) => Virabotka.fromJson(e)).toList();
  }

  // fetchListAutoService(String page) async {
  //   var json = await api.getallByName(Ui.urlservice, "&&&", page);
  //   List<AutoService> _list = json.map((e) => AutoService.fromJson(e)).toList();
  //   for (int i = 0; i < _list.length; i++) {
  //     bool exist = this.listAutoService.value
  //         .where((element) =>
  //             element.rownumber != _list[i].rownumber)
  //         .isEmpty;
  //     if(!exist || this.listAutoService.value.length == 0){
  //       this.listAutoService.value.add(_list[i]);
  //     }
  //   }
  //   // update();
  // }
  //
  // incrementPageService() {
  //   this.pageService.value += 1;
  // }

  changePage(int page) {
    this.page.value = page;
     update();
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
