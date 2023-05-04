import 'package:flutter_template/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/publish_module/publish_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PublishPage extends GetWidget<PublishController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("PublishPage").build(context),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
