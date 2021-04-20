import 'package:duo_hao/common/style/style.dart';
import 'package:duo_hao/routes/app_pages.dart';
import 'package:duo_hao/widget/common/my_app_bar.dart';
import 'package:duo_hao/widget/common/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logic.dart';
import 'state.dart';

class ProfilePage extends StatelessWidget {
  final ProfileLogic logic = Get.put(ProfileLogic());
  final ProfileState state = Get.find<ProfileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("mine").build(context),
      body: Column(
        children: [
          MySuperWidget(
            text: " config",
            onTap: () {},
            fontSize: 32.sp,
            textColor: Colors.white,
            bgColor: randomColor(),
            height: 88.w,
            radius: 12.w,
            margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
          ),
          MySuperWidget(
            text: " 注册",
            onTap: ()=> Get.toNamed(Routes.SIGN_UP),
            fontSize: 32.sp,
            textColor: Colors.white,
            bgColor: randomColor(),
            height: 88.w,
            radius: 12.w,
            margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
          ),
          MySuperWidget(
            text: " 退出登录",
            onTap: () => Get.offAllNamed(Routes.LOGIN),
            fontSize: 32.sp,
            textColor: Colors.white,
            bgColor: randomColor(),
            height: 88.w,
            radius: 12.w,
            margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
          ),
        ],
      ),
    );
  }
}
