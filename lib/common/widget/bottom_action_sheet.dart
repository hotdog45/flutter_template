import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class BottomActionSheet {
  static show(BuildContext context, List data, {callBack, isScroll = false}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14))),
            child: SafeArea(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //为了防止控件溢出
                    Flexible(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Flexible(
                                    child: ListView.builder(
                                        physics: isScroll
                                            ? AlwaysScrollableScrollPhysics()
                                            : NeverScrollableScrollPhysics(),
                                        shrinkWrap: !isScroll,
                                        itemCount: data.length,
                                        itemBuilder: (context, index) {
                                          return Column(children: <Widget>[
                                            ListTile(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  callBack(index);
                                                },
                                                title: Text(data[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: kAppTextColor))),
                                            index == data.length - 1
                                                ? Container()
                                                : Container(
                                                    height: 1,
                                                    color: Color(0xFFF1F1F1),
                                                    margin: EdgeInsets.only(
                                                        left: 16, right: 16))
                                          ]);
                                        }))
                              ],
                            ))),
                    Container(
                      height: 8,
                      color: Color(0xFFF1F1F1),
                      // color: Colors.purple,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 44,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Text('取消',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16, color: kAppTextColor)),
                      ),
                      onTap: () {
                        //点击取消 弹层消失
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
