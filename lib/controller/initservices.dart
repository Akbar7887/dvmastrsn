import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Controller.dart';

Future<void> initServices() async {
  print('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(() => DbService().init());
  //await Get.putAsync(SettingsService()).init());
  print('All services started...');
}

class DbService extends GetxService {
  final Controller controller = Get.put(Controller());

  Future<DbService> init() async {
    controller.onInit();

    // await 2.delay();
    // print('$runtimeType ready!');
    return this;
  }
}

// class SettingsService extends GetxService {
//   void init() async {
//     print('$runtimeType delays 1 sec');
//     await 1.delay();
//     print('$runtimeType ready!');
//   }
// }
