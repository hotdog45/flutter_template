
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widget/app_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

                MySuperWidget(
                  text: "登录",

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
