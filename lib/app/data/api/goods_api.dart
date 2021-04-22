import 'package:duo_hao/app/data/model/goods_model.dart';
import 'package:duo_hao/app/data/net/http_manager.dart';
import 'package:duo_hao/config/config.dart';
import 'package:get/get.dart';

class GoodsApi {
  final String _goodsList = '/goods/list';
  final String _goodsDetails = '/goods/details';
  final HttpManager _dio = Get.find<HttpManager>();

  //商品列表
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

  //商品详情
  Future<GoodsModel> getGoodsDetails(String id) async {

    var jsonData = await _dio.netFetch(_goodsDetails, {"id": id});
    GoodsModel goodsModel = GoodsModel.fromJson(jsonData);
    return goodsModel;
  }
}
