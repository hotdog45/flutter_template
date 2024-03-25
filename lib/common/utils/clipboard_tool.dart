import 'package:flutter/services.dart';

import 'toast_utils.dart';

//复制粘贴
class ClipboardTool {
  //设置粘贴板
  static setData(String data) {
    Clipboard.setData(ClipboardData(text: data));
  }

  //设置粘贴板
  static setDataToast(String data) {
    if (data.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: data));
      MyToast.show('复制成功');
    }
  }

  //获取内容
  static Future<ClipboardData?> getData() {
    return Clipboard.getData(Clipboard.kTextPlain);
  }

  //获取内容
  static Future<String> getText() async {
    ClipboardData? data = await getData();
    return data?.text ?? "";
  }

//将内容复制系统
//   ClipboardUtil.setData('123');
//从系统获取内容
//   ClipboardUtil.getData().then((data){}).catchError((e){});
}
