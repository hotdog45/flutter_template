// import 'dart:html';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
//
// class H5WebViewPage extends StatefulWidget {
//   final String url;
//   final String title;
//
//   const H5WebViewPage({Key key, this.url = "https://www.baidu.com", this.title})
//       : super(key: key);
//
//   @override
//   _H5WebViewPageState createState() => _H5WebViewPageState();
// }
//
// class _H5WebViewPageState extends State<H5WebViewPage> {
//   IFrameElement _element;
//   @override
//   void initState() {
//     //注册
//     _element = IFrameElement()
//       ..style.border = 'none'
//       ..src = widget.url;
//     //html.window.open('https://www.baidu.com','baidu');
//     //屏蔽报错
//     // ignore:undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       'webInWeb',
//       (int viewId) => _element,
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           centerTitle: true,
//         ),
//         body: Container(child: HtmlElementView(viewType: 'webInWeb')));
//   }
// }
