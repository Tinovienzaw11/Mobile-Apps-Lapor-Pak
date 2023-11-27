import 'package:get/get.dart';

import '../controllers/buat_laporan_controller.dart';

class BuatLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatLaporanController>(
      () => BuatLaporanController(),
    );
  }
}
