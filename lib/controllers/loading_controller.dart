import 'package:get/get.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingControler extends BaseController {
  void startLoading() {
    Get.context.loaderOverlay.show();
  }

  void stopLoading() {
    if (context.loaderOverlay.visible) {
      context.loaderOverlay.hide();
    }
  }
}
