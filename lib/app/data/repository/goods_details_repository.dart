import 'package:flutter_template/app/data/api/goods_api.dart';
import 'package:get/get.dart';


class GoodsDetailsRepository {
  final GoodsApi api = Get.find<GoodsApi>();

  getGoodsDetails(id) {
    return api.getGoodsDetails(id);
  }

}