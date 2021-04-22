import 'package:duo_hao/app/modules/home_module/home_controller.dart';
import 'package:duo_hao/app/routes/app_pages.dart';
import 'package:duo_hao/app/theme/app_colors.dart';
import 'package:duo_hao/widget/my_app_bar.dart';
import 'package:duo_hao/widget/my_super_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
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
