import 'package:get/get.dart';

import '../controllers/berita_detail_controller.dart';

class BeritaDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritaDetailController>(
      () => BeritaDetailController(),
    );
  }
}
