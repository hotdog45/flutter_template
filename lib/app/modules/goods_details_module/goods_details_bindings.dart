import 'package:duo_hao/app/data/repository/goods_details_repository.dart';
import 'package:duo_hao/app/modules/goods_details_module/goods_details_controller.dart';
import 'package:get/get.dart';


class GoodsDetailsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GoodsApi());
    Get.lazyPut(
        () => GoodsDetailsController(repository: GoodsDetailsRepository()));
  }
}
