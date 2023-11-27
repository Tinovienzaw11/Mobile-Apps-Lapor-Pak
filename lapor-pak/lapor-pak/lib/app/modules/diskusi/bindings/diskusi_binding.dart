import 'package:get/get.dart';

import '../controllers/diskusi_controller.dart';

class DiskusiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiskusiController>(
      () => DiskusiController(),
    );
  }
}
