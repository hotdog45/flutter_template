import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  final Color color;
  final double height;
  final double left;
  final double right;
  final double top;
  final double bottom;

  const LineWidget(
      {Key? key,
      this.color = const Color(0xFFefeff4),
      this.height = 0.5,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
    );
  }
}
