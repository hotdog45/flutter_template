
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../model/goods_model.dart';
import '../net/http_manager.dart';

class HomeApi {
  final String _goodsList = '/goods/list';
  final String _goodsDetails = '/goods/details';
  final HttpManager _dio = Get.find<HttpManager>();


  Future<List<GoodsModel>> getGoodsList({int page = 1}) async {
    var jsonData = await _dio.netFetch(
        _goodsList, {"page": page, "pageSize": Config.PAGE_SIZE},
        method: "get");
    if (jsonData == null) {
      return [];
    }
    List<GoodsModel> _list = [];
    jsonData.forEach((v) => _list.add(GoodsModel.fromJson(v)));
    return _list;
  }

  Future<GoodsModel> getGoodsDetails(String id) async {

    var jsonData = await _dio.netFetch(_goodsDetails, {"id": id});
    GoodsModel goodsModel = GoodsModel.fromJson(jsonData);
    return goodsModel;
  }
}
