import 'package:flutter_template/app/data/model/goods_model.dart';
import 'package:flutter_template/app/routes/app_pages.dart';
import 'package:flutter_template/app/theme/app_colors.dart';
import 'package:flutter_template/widget/my_image.dart';
import 'package:flutter_template/widget/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/model/goods_model.dart';

class GoodsItemWidget extends StatelessWidget {
  final GoodsModel model;

  const GoodsItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySuperWidget(
      onTap: () => Get.toNamed(Routes.GOODS_DETAILS, arguments: {"id": 123456}),
      child: Column(
        children: [
          MySuperWidget(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            height: 164.w,
            bgColor: Colors.white,
            child: Row(
              children: [
                MyImage(
                  model.image,
                  width: 88.w,
                  height: 88.w,
                  isOval: true,
                  margin: EdgeInsets.only(right: 24.w),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySuperWidget(
                        text: model.goodsName ?? "",
                        fontSize: 32.sp,
                        maxLines: 1,
                        alignment: Alignment.centerLeft,
                        textColor: kAppTextColor,
                      ),
                      MySuperWidget(
                        text: model.subTitle ?? "",
                        fontSize: 28.sp,
                        maxLines: 1,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 16.w),
                        textColor: kAppColor("#B7B7BB"),
                      ),
                    ],
                  ),
                ),
                MySuperWidget(
                    text: model.price ?? "" + "元",
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                    margin: EdgeInsets.only(bottom: 60.w),
                    textColor: kAppColor("#FFA640") //,
                    ),
              ],
            ),
          ),
          MySuperWidget(
            margin: EdgeInsets.only(left: 104.w, right: 30.w),
            bgColor: kAppColor("#F0F0F0"),
            height: 0.5,
          )
        ],
      ),
    );
  }
}
