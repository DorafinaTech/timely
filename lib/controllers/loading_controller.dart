import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingControler extends BaseController {
  void startLoading() {
    Get.context?.loaderOverlay.show();
  }

  void stopLoading() {
    try {
      if (Get.context!.loaderOverlay.visible) {
        Get.context?.loaderOverlay.hide();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
