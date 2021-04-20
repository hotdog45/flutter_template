import 'package:duo_hao/common/style/style.dart';
import 'package:duo_hao/widget/common/my_app_bar.dart';
import 'package:duo_hao/widget/common/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../modules/user/sign_up/logic.dart';
import 'state.dart';

class SignUpPage extends StatelessWidget {
  final SignUpLogic logic = Get.put(SignUpLogic());
  final SignUpState state = Get.find<SignUpLogic>().state;

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
