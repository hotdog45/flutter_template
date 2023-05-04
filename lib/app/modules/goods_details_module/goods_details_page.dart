import 'package:flutter_template/app/theme/app_colors.dart';
import 'package:flutter_template/widget/my_app_bar.dart';
import 'package:flutter_template/widget/my_image.dart';
import 'package:flutter_template/widget/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/goods_details_module/goods_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class GoodsDetailsPage extends GetWidget<GoodsDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("goods Details").build(context),
      body: Container(
          child: Obx(
        () => MySuperWidget(
          padding: EdgeInsets.only(top: 30.w, left: 30.w, right: 30.w),
          bgColor: Colors.white,
          child: Column(
            children: [
              MyImage(
                controller.goodsModel.value.image ?? "",
                width: 690.w,
                height: 690.w,
              ),
              MySuperWidget(
                text: controller.goodsModel.value.goodsName ?? "",
                fontSize: 32.sp,
                maxLines: 1,
                alignment: Alignment.centerLeft,
                textColor: kAppTextColor,
              ),
              MySuperWidget(
                text: controller.goodsModel.value.subTitle ?? "",
                fontSize: 28.sp,
                maxLines: 1,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 16.w),
                textColor: kAppColor("#B7B7BB"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
