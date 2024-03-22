import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/my_app_bar.dart';
import '../../../widget/my_super_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../utils/toast_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Profile").build(context),
      body: Container(
          child: Column(
        children: [
          MySuperWidget(
            text: " config",
            onTap: ()async {
              var dio = Dio();
              var response = await dio.get('https://www.fastmock.site/mock/e9989c53677bb7ea0b00f2c37e5f95ae/duohao/goods/list');
              print(response.data.toString());
              MyToast.show("test..."+response.data.toString());
            },
            fontSize: 32.sp,
            textColor: Colors.white,
            bgColor: randomColor(),
            height: 88.w,
            radius: 12.w,
            margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
          ),
          MySuperWidget(
            text: " 注册",
            // onTap: ()=> Get.toNamed(Routes.SIGN_UP),
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
      )),
    );
  }
}
