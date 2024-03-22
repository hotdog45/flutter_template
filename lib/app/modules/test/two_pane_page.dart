import 'package:flutter/material.dart';
import '../../../widget/my_app_bar.dart';
import '../../../widget/my_super_widget.dart';
import '../../theme/app_colors.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("SettingPage").build(context),
      body: ListView(
        children: [
          _testBtn("test原生通信", () {
            //
          }),
          _testBtn("init", () async {
            //
          })
        ],
      ),
    );
  }

  _testBtn(title, onTap) {
    return MySuperWidget(
      text: title,
      onTap: onTap,
      fontSize: 13,
      textColor: Colors.white,
      bgColor: randomColor(),
      height: 60,
      radius: 12,
      margin: const EdgeInsets.only(top: 10, left: 60, right: 60),
    );
  }
}
