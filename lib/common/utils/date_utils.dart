
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class MyDateUtils {


  /// 时间戳转换成 时间字符串
  static String changeTimestampToDateString(int timestamp) {
    DateTime dateStr = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String str = dateStr.toString();
    return str.split('.').first;
  }
  /// 计算历史时间点距离当前多少个小时的时间间隔
  static num getIntervalHoursFromTimestamp(int timestamp, int endTimestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime endTime = DateTime.now();
    if(endTimestamp != null && endTimestamp > 0){
      endTime = DateTime.fromMillisecondsSinceEpoch(endTimestamp);
    }
    num value = num.parse((endTime.difference(dateTime).inMinutes / 60.0).toStringAsFixed(1));
    return value;
  }

  /// 当前时间和提供时间对比，提供时间是否超过当前时间
  static bool isOverTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime endTime = DateTime.now();
    num value = num.parse((endTime.difference(dateTime).inSeconds / 60.0).toStringAsFixed(1));
    return value > 0 ? true : false;
  }
  /// 时间字符串转换成时间戳
  static int changeTimeStringToTimestamp(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return dateTime.millisecondsSinceEpoch;
  }
}