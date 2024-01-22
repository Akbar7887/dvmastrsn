import 'package:dvmastrsn/models/Naryad.dart';
import 'package:get/get.dart';

import 'ApiConnector.dart';

class Controller extends GetxController{

  final api = ApiConnector();
  var listNaryad = <Naryad>[].obs;

  @override
  onInit() {
    // fetchListNyad("DVБП-00183");
    super.onInit();
  }

 fetchListNyad(String id, String date) async {
    final json = await api.getall("dv_test/hs/mobile/zakaz/", id, date);
    listNaryad.value = json.map((e) => Naryad.fromJson(e)).toList();
    // listKompleks.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}