import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingControler extends BaseController {
  Future<void> startLoading() async {
    return Get.context?.loaderOverlay.show();
  }

  Future<void> stopLoading() async {
    try {
      if (Get.context!.loaderOverlay.visible) {
        Get.context?.loaderOverlay.hide();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
