import 'package:get/get.dart';

import '../controllers/disdukcapil_form_controller.dart';

class DisdukcapilFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisdukcapilFormController>(
      () => DisdukcapilFormController(),
    );
  }
}
