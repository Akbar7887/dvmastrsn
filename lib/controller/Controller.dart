import 'package:dvmastrsn/models/Naryad.dart';
import 'package:dvmastrsn/models/Virabotka.dart';
import 'package:get/get.dart';

import '../ui.dart';
import 'ApiConnector.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  var listNaryad = <Naryad>[].obs;
  var listVirabotka = <Virabotka>[].obs;
  var page = 0.obs;
  var fio = "".obs;
  var tabel = "".obs;

  @override
  onInit() {
    tabel.value = "DVБП-00175";
    // fetchListNyad("DVБП-00183");
    page.value = 2;
    fio.value = "Toshmat EFGREG ergvREGV";
    super.onInit();
  }

  fetchListNyad(String id, String date) async {
    final json = await api.getall(Ui.urlzakaz, date);
    listNaryad.value = json.map((e) => Naryad.fromJson(e)).toList();
    // listKompleks.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

  fetchListVirabotka() async {
    final json = await api.getall(Ui.urlvirabotka, "");
    listVirabotka.value = json.map((e) => Virabotka.fromJson(e)).toList();
  }

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
