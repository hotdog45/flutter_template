import 'package:flutter_template/app/data/repository/goods_list_repository.dart';
import 'package:flutter_template/common/extension/get_extension.dart';
import 'package:get/get.dart';


class GoodsListController extends GetxController{

  final GoodsListRepository repository;

  GoodsListController({required this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  int page = 1;
  final RxList list = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    getGoodsList();

  }

    getGoodsList() async {
    Get.loading();
    try {
      list.value = await repository.getGoodsList(page);
      Get.dismiss();
    } catch (e) {
      Get.dismiss();
      Get.snackbar('Error', e.toString());
    }
  }
}
