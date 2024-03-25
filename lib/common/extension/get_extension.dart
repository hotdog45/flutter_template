import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widget/app_widget.dart';

export 'package:get/get.dart';

extension GetExtension on GetInterface {
  void dismiss<T>({T? result}) {
    if (Get.isDialogOpen ?? false) {
      Get.back(result: result);
    }
  }

  void loading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Get.dialog(LoadingDialog(), barrierColor: Colors.transparent);
  }
}
