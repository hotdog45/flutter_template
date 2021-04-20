import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
/**
 * Copyright (C), 2015-2021, 谊品生鲜
 * FileName: MyToast
 * Author: lishunfeng
 * Date: 2/19/21 1:56 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class MyToast {

  static show(text){
    BotToast.showText(text:text ?? "");
  }

}