import 'package:get/get.dart';

import '../controllers/diskusi_create_controller.dart';

class DiskusiCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiskusiCreateController>(
      () => DiskusiCreateController(),
    );
  }
}
