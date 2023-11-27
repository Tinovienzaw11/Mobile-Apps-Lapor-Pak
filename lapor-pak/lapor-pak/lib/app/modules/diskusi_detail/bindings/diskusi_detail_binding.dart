import 'package:get/get.dart';

import '../controllers/diskusi_detail_controller.dart';

class DiskusiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiskusiDetailController>(
      () => DiskusiDetailController(),
    );
  }
}
