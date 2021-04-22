import 'package:duo_hao/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_hao/app/modules/goods_list_module/goods_list_controller.dart';

import 'widget/goods_item_widget.dart';

class GoodsListPage extends GetWidget<GoodsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("goods list").build(context),
      body: Container(
          child: Obx(
        () => ListView.builder(
            itemBuilder: (context, index) {
              return GoodsItemWidget(model: controller.list[index]);
            },
            itemCount: controller.list.length,
            padding: EdgeInsets.all(0)),
      )),
    );
  }
}
