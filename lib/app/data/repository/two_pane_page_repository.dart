import 'package:flutter_template/app/data/provider/two_pane_page_provider.dart';
import 'package:flutter/cupertino.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class TwoPanePageRepository {
  final TwoPanePageProvider provider;

  TwoPanePageRepository({required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}