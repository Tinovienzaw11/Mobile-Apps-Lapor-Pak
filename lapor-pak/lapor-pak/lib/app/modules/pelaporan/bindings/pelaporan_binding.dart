import 'package:get/get.dart';

import '../controllers/pelaporan_controller.dart';

class PelaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelaporanController>(
      () => PelaporanController(),
    );
  }
}
