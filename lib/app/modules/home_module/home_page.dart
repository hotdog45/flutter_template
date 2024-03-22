
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widget/my_app_bar.dart';
import '../../../widget/my_super_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("home page").build(context),
      body: Center(
        child: Column(
          children: [
            MySuperWidget(
              text: "商品列表页22...",
              onTap: () {
                Get.toNamed(Routes.GOODS_LIST);
              },
              fontSize: 32.sp,
              textColor: Colors.white,
              bgColor: randomColor(),
              height: 88.w,
              radius: 12.w,
              margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
            ),
            MySuperWidget(
              text: "测试",
              onTap: () {

              },
              fontSize: 32.sp,
              textColor: Colors.white,
              bgColor: randomColor(),
              height: 88.w,
              radius: 12.w,
              margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
            ),
            MySuperWidget(
              text: "测试22",
              onTap: () {
                // Get.snackbar('新消息', 'Your Email not be null');

                // Get.to(H5WebViewPage(title: "测试",url: "https://www.baidu.com",));
                launch("https://www.baidu.com");
              },
              fontSize: 32.sp,
              textColor: Colors.white,
              bgColor: randomColor(),
              height: 88.w,
              radius: 12.w,
              margin: EdgeInsets.only(top: 80.w, left: 60.w, right: 60.w),
            ),
            Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F1812.img.pp.sohu.com.cn%2Fimages%2Fblog%2F2009%2F11%2F18%2F18%2F8%2F125b6560a6ag214.jpg&refer=http%3A%2F%2F1812.img.pp.sohu.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621649257&t=5fb479c8039cd8132ef25af1a4c0f342",
              width: 400,
              height: 300,
            ),

          ],
        ),
      ),
    );
  }
}
