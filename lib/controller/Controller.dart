import 'package:dvmastrsn/models/Naryad.dart';
import 'package:get/get.dart';

import 'ApiConnector.dart';

class Controller extends GetxController{

  final api = ApiConnector();
  var listNaryad = <Naryad>[].obs;

  @override
  onInit() {

    super.onInit();
  }

 fetchListNyad(String id) async {
    final json = await api.getall("dv_test/hs/mobile/zakaz/", id);
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