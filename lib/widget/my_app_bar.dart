import 'package:flutter/material.dart';
class MyAppBar {
  final String title;
  final bool hasBackBtn;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final Function? onBack;

  MyAppBar(this.title,
      {this.hasBackBtn = true,
        this.centerTitle = true,
        this.titleWidget,
        this.onBack,
        this.actions});

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      centerTitle: centerTitle,
      title: titleWidget ??
          Text(title, style: TextStyle(color: Color(0xFF0D0E15), fontSize: 18, fontWeight: FontWeight.bold)),
      automaticallyImplyLeading: hasBackBtn,
      leading: hasBackBtn && Navigator.canPop(context)
          ? IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon:
          Icon(Icons.chevron_left, size: 35, color: Color(0xFF0D0E15)),
          onPressed: () {

            if(onBack !=null){
              onBack!();
            }else{
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            }
          })
          : Container(),
      actions: actions,
    );
  }
}
