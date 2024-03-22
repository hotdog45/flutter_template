import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';

class CupertinoAlertWidget {

  static showCupertinoSheetAlert({required BuildContext context, String title = '', required List<String> actions, bool showCancel = true, required Function callBack }){
    showCupertinoModalPopup(context: context, builder: (context){
      return title.length > 0 ? CupertinoActionSheet(
        title: Text(title),
        actions: actions.map((e) => CupertinoDialogAction(
          child: Text(e),
          onPressed: () {
            Navigator.of(context).pop();
            callBack(e);
          },
        ),).toList(),
        cancelButton: showCancel ? CupertinoDialogAction(
          child: Text('取消'),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ) : SizedBox(),
      ) : CupertinoActionSheet(
        actions: actions.map((e) => CupertinoDialogAction(
          child: Text(e),
          onPressed: () {
            Navigator.of(context).pop();
            callBack(e);
          },
        ),).toList(),
        cancelButton: showCancel ? CupertinoDialogAction(
          child: Text('取消'),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ) : SizedBox(),
      );
    });
  }

  static showCupertinoCenterAlert({required BuildContext context, String title = '', String content = '', required List<String> actions, int primary = 1, required Function callBack }){
    showCupertinoDialog(context: context, builder: (context){
      if(actions.length == 0) return SizedBox();
      String primaryText = actions.first;
      if(primary < actions.length){
        primaryText = actions[primary];
      }
      return title.length > 0 ? CupertinoAlertDialog(
        title: Text(title),
        content: content.length > 0 ? Text(content) : SizedBox(),
        actions: actions.map((e) => CupertinoDialogAction(
          child: Text(e, style: TextStyle(color: e == primaryText ? kAppTextColor : kAppSubTextColor),),
          onPressed: () {
            Navigator.of(context).pop();
            callBack(e);
          },
        ),).toList(),
      ) : CupertinoAlertDialog(
        content: Text(content),
        actions: actions.map((e) => CupertinoDialogAction(
          child: Text(e, style: TextStyle(color: e == primaryText ? kAppTextColor : kAppSubTextColor),),

          onPressed: () {
            Navigator.of(context).pop();
            callBack(e);
          },
        ),).toList(),
      );
    });
  }

  /// 自定义中心 widget
  static showCupertinoCenterAlert_Customize({required BuildContext context, String title = '', required Widget centerChild, required List<String> actions, bool showCancel = true, required Function callBack }){
    showCupertinoDialog(context: context, builder: (context){
      return title.length > 0 ? CupertinoAlertDialog(
        title: Text(title),
        content: centerChild,
        actions: actions.map((e) => CupertinoDialogAction(
          child: Text(e),
          textStyle: e == '取消' ? TextStyle(color: kAppSubTextColor) : TextStyle(color: kAppPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
            callBack(e);
          },
        ),).toList(),
      ) : CupertinoAlertDialog(
        content: centerChild,
        actions: actions.map((e) => CupertinoDialogAction(
          child: Text(e),
          textStyle: e == '取消' ? TextStyle(color: kAppSubTextColor) : TextStyle(color: kAppPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
            callBack(e);
          },
        ),).toList(),
      );
    });
  }


}