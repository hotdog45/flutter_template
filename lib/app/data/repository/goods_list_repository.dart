import 'package:duo_hao/app/data/api/goods_api.dart';
import 'package:get/get.dart';

class GoodsListRepository {
  final GoodsApi api = Get.find<GoodsApi>();

  getGoodsList(page) {
    return api.getGoodsList(page:page);
  }

}