import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/not_found_module/not_found_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class NotFoundPage extends GetWidget<NotFoundController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NotFound Page')),
      body: Container(child: Text( "404")),
    );
  }
}
