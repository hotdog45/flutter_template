import 'package:duo_hao/app/data/api/goods_api.dart';
import 'package:duo_hao/app/modules/goods_list_module/goods_list_controller.dart';
import 'package:duo_hao/app/data/repository/goods_list_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class GoodsListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoodsApi());
    Get.lazyPut(() => GoodsListController(repository: GoodsListRepository( )));
  }
}