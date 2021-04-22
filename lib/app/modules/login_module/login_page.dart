import 'package:duo_hao/app/modules/login_module/login_controller.dart';
import 'package:duo_hao/app/theme/app_colors.dart';
import 'package:duo_hao/widget/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MySuperWidget(
                  text: "用户登录",
                  fontSize: 50.sp,
                  textColor: kAppColor("#0D0E15"),
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 257.w, left: 75.w),
                ),
                MySuperWidget(
                  text: "User login",
                  fontSize: 50.sp,
                  textColor: kAppColor("#E4E4E9"),
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 16.w, left: 75.w),
                ),
                _loginView(),
                MySuperWidget(
                  text: "登录",
                  onTap: controller.login,
                  fontSize: 32.sp,
                  textColor: Colors.white,
                  bgColor: kAppPrimaryColor,
                  height: 88.w,
                  radius: 12.w,
                  margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
                ),
                MySuperWidget(
                  text: "注册",
                  onTap: () {},
                  fontSize: 32.sp,
                  textColor: kAppColor("#C0342D"),
                  bgColor: Colors.white,
                  height: 88.w,
                  borderColor: kAppPrimaryColor,
                  hasBorder: true,
                  radius: 12.w,
                  margin: EdgeInsets.only(top: 30.w, left: 60.w, right: 60.w),
                ),
                _goCheckBtn(),
              ]),
        ));
  }

  Widget _loginView() {
    return Container(
        padding: EdgeInsets.only(left: 60.w, right: 60.w, top: 90.w),
        child: Column(children: <Widget>[
          MySuperWidget(
            bgColor: kAppColor("#F1F1F1"),
            radius: 4,
            padding: EdgeInsets.only(left: 40.w, right: 20.w),
            child: TextFormField(
              initialValue: controller.userName,
              decoration: InputDecoration(
                hintText: '手机号',
                hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
                border: InputBorder.none,
              ),
              onChanged: (v) =>controller.onUsernameChanged(v),
              style: TextStyle(fontSize: 34.sp, color: kAppTextColor),
              textAlign: TextAlign.left,
            ),
          ),
          MySuperWidget(
            bgColor: kAppColor("#F1F1F1"),
            radius: 4,
            margin: EdgeInsets.only(top: 30.w),
            padding: EdgeInsets.only(left: 40.w, right: 20.w),

            child: TextFormField(
              initialValue: controller.pwd,
              decoration: InputDecoration(
                hintText: '密码',
                hintStyle: TextStyle(color: Color(0xffc3c3c3)), //修改颜色
                border: InputBorder.none,
              ),
              obscureText: true,
              onChanged: (v) =>controller.onPasswordChanged(v),
              style: TextStyle(fontSize: 34.sp, color: kAppTextColor),
              textAlign: TextAlign.left,
            ),
          ),
        ]));
  }

  Widget _goCheckBtn() {
    return Container(
      margin: EdgeInsets.only(top: 50.w, left: 60.w, right: 60.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MySuperWidget(
            onTap: () {},
            text: "忘记密码？",
            textColor: kAppColor("#363638"),
            fontSize: 32.sp,
          ),
          Expanded(child: Container()),
          MySuperWidget(
            onTap: () {},
            text: "注册",
            textColor: kAppColor("#363638"),
            fontSize: 32.sp,
          ),
        ],
      ),
    );
  }
}
