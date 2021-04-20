import 'package:duo_hao/common/style/style.dart';
import 'package:duo_hao/widget/common/my_app_bar.dart';
import 'package:duo_hao/widget/common/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logic.dart';


class PublishPage extends StatelessWidget {
  final PublishLogic logic = Get.put(PublishLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("发布页面").build(context),
      body: Center(child:MySuperWidget(
        text:  "发布页面 疯狂搭建中...",
        onTap: (){

        },
        fontSize:32.sp,
        textColor: Colors.white,
        bgColor: randomColor(),
        height: 88.w,
        radius: 12.w,
        margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
      ),),
    );
  }
}
