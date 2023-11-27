import 'package:get/get.dart';

import '../controllers/setting_akun_controller.dart';

class SettingAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingAkunController>(
      () => SettingAkunController(),
    );
  }
}
