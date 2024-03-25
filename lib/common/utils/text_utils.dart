import 'package:flutter/material.dart';

class TextUtils {
  static bool isEmpty(String? value) {
    return value == null || value == "";
  }

  static String getNonStr(String value, {String? ifNonReplace}) {
    return isEmpty(value) ? (ifNonReplace == null ? "" : ifNonReplace) : value;
  }

  /// 计算字符串显示高度
  static double getTextSizeHeight(BuildContext context, String text, TextStyle style,  {int maxLines = 2^31, double maxWidth = double.infinity}) {
    if (text == null || text.isEmpty) {
      return 0.0;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        locale: Localizations.localeOf(context),
        text: TextSpan(text: text, style: style), maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size.height;
  }

  // 是否包含中文
  static final String CHINESE_REGEX = "[\u4e00-\u9fa5]";
  static bool isContainChinese(String? input) {
    if (input == null || input.isEmpty) return false;
    return new RegExp(CHINESE_REGEX).hasMatch(input);
  }

  static String clearChineseWord(String? input){
    if (input == null || input.isEmpty) return '';
    String outPut = '';
    for(int i = 0; i < input.length; i++){
      String tempStr = input.substring(i, i+1);
      if(isContainChinese(tempStr)){
        print('是中文----$tempStr');
      } else {
        outPut = outPut + tempStr;
      }
    }
    return outPut;
  }

  static String getJointString({required List stringList}){
    String result = '';
    for(int i = 0; i < stringList.length; i++){
      if(result.length > 0){
        result = result + ',' + stringList[i];
      } else {
        result = stringList[i];
      }
    }
    return result;
  }
}
