import 'dart:async';

import 'package:flutter/material.dart';
/**
 * Copyright (C), 2015-2021, 谊品生鲜
 * FileName: current_limitingUtil
 * Author: lishunfeng
 * Date: 3/23/21 9:51 PM
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class CurrentLimitingUtil {
  static const deFaultDurationTime = 500;
  static Timer timer;

  // 防抖函数
  static debounce(Function doSomething, {durationTime = deFaultDurationTime}) {
    timer?.cancel();
    timer = new Timer(Duration(milliseconds: durationTime), () {
      doSomething?.call();
      timer = null;
    });
  }

  // 节流函数
  static const String deFaultThrottleId = 'DeFaultThrottleId';
  static Map<String, int> startTimeMap = {deFaultThrottleId: 0};
  static throttle(Function doSomething, {String throttleId = deFaultThrottleId, durationTime = deFaultDurationTime, Function continueClick}) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - (startTimeMap[throttleId] ?? 0) > durationTime) {
      doSomething?.call();
      startTimeMap[throttleId] = DateTime.now().millisecondsSinceEpoch;
    } else {
      continueClick?.call();
    }
  }

}