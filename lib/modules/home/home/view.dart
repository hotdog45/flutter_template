import 'package:duo_hao/common/style/style.dart';
import 'package:duo_hao/widget/common/my_app_bar.dart';
import 'package:duo_hao/widget/common/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("home").build(context),
      body: Center(child:MySuperWidget(
        text:  "home 疯狂搭建中...",
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
