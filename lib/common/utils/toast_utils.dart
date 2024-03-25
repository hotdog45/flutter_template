import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

final myToast = MyToast();

class MyToast {
  static void show(text) {
    BotToast.showText(text: text.toString());
  }

  CancelFunc? _cancelFunc;

  void showLoading({String text = ''}) {
    double height = text.length > 0 ? 102 : 68;
    BotToast.showCustomLoading(
        align: Alignment.center,
        backgroundColor: Colors.transparent,
        toastBuilder: (cancelFunc) {
          _cancelFunc = cancelFunc;
          return Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 10),
              height: height,
              decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  const CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                  text.length > 0
                      ? Container(
                          child: Text(
                            text,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.only(top: 15),
                        )
                      : SizedBox(),
                ],
              ));
        });
  }

  void closeLoading() {
    if (_cancelFunc == null) {
      BotToast.closeAllLoading();
    } else {
      _cancelFunc!();
    }

    _cancelFunc = null;
  }
}
