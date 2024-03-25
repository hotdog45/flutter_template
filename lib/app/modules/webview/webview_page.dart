import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/utils/log_utils.dart';
import '../../../common/widget/app_widget.dart';
class WebViewPage extends StatefulWidget {
  final String url;
  final bool hasNav;
  final bool originalUrl;
  final String title;

  const WebViewPage(
      {super.key,
      required this.url,
      this.hasNav = true,
      this.originalUrl = false,
      this.title = ""});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;

  var initialUrl = "";
  double value = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    logger.i("原始Url==>" + widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hasNav ? MyAppBar(widget.title).build(context) : null,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: kAppBcgColor,
          child: Stack(
            children: <Widget>[
              Builder(builder: (BuildContext context) {
                return WebView(
                  initialUrl: widget.url,
                  backgroundColor: Colors.white,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated:
                      (WebViewController webViewController) async {
                    _controller = webViewController;
                  },
                  javascriptChannels: <JavascriptChannel>[].toSet(),
                  onPageStarted: (String url) {},
                  onProgress: (p) {
                    try {
                      value = p / 100;
                      setState(() {});
                    } catch (e) {}
                  },
                  onWebResourceError: (e) {
                    logger.e("onWebResourceError" + e.description);
                    // _controller?.clearCache();
                  },
                  onPageFinished: (String url) {
                    logger.i('Page finished loading: $url');
                  },
                  navigationDelegate: (NavigationRequest request) {
                    return NavigationDecision.navigate;
                  },
                  gestureNavigationEnabled: true,
                );
              }),
              if (value != 1)
                LinearProgressIndicator(
                    value: value,
                    minHeight: 1,
                    color: Colors.green,
                    backgroundColor: Colors.transparent),
            ],
          ),
        ),
      ),
      floatingActionButton: !kReleaseMode
          ? FloatingActionButton(
              child: Icon(Icons.backspace_outlined),
              onPressed: () {
                // _controller.runJavascript("APP.postMessage('toast&张三李四王麻子&82');");
                Get.back();
              },
            )
          : Container(),
    );
  }
}
