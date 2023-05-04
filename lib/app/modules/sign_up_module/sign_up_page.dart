import 'package:flutter_template/app/theme/app_colors.dart';
import 'package:flutter_template/widget/my_app_bar.dart';
import 'package:flutter_template/widget/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/sign_up_module/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends GetWidget<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("注册").build(context),
      body: Center(child: MySuperWidget(
        text: "注册 疯狂搭建中...",
        onTap: () {

        },
        fontSize: 32.sp,
        textColor: Colors.white,
        bgColor: randomColor(),
        height: 88.w,
        radius: 12.w,
        margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
      ),),
    );
  }
}
