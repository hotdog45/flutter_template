import 'package:bot_toast/bot_toast.dart';


class MyToast {

  static show(text){
    BotToast.showText(text:text ?? "");
  }

}