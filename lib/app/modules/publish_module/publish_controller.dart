import 'package:duo_hao/app/data/repository/publish_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PublishController extends GetxController{

  final PublishRepository repository;

  PublishController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
