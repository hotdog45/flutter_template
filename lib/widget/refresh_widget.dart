import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class MyRefresh extends StatelessWidget {
  final EasyRefreshController refreshController;
  final Widget child;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final bool hiddenFooter;

  MyRefresh({
    required this.refreshController,
    required this.child,
    required this.onRefresh,
    required this.onLoading,
    this.hiddenFooter = false,
  });

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        header: const CupertinoHeader(
          position: IndicatorPosition.locator,
        ),
        footer: const CupertinoFooter(position: IndicatorPosition.locator),
        controller: refreshController,
        child: child,
        onRefresh: onRefresh,
        onLoad: onLoading);
  }
}
