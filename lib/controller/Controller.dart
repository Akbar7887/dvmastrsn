import 'package:get/get.dart';

class Controller extends GetxController{


}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}