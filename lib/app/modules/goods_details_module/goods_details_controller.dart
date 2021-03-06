import 'package:duo_hao/app/data/model/goods_model.dart';
import 'package:duo_hao/app/data/repository/goods_details_repository.dart';
import 'package:get/get.dart';
import 'package:duo_hao/common/extension/get_extension.dart';


class GoodsDetailsController extends GetxController{

  final GoodsDetailsRepository repository;

  GoodsDetailsController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
  var id = Get.arguments["id"];
  var goodsModel = GoodsModel().obs;
  @override
  void onReady() async {
    super.onReady();
    getGoodsDetails();
  }

  getGoodsDetails() async {
    Get.loading();
    try {
      goodsModel.value = await repository.getGoodsDetails(id.toString());
      Get.dismiss();
    } catch (e) {
      Get.dismiss();
      Get.snackbar('Error', e ?? "请求失败~");
    }
  }
}
