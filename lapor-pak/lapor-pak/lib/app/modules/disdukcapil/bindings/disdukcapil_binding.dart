import 'package:get/get.dart';

import '../controllers/disdukcapil_controller.dart';

class DisdukcapilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisdukcapilController>(
      () => DisdukcapilController(),
    );
  }
}
