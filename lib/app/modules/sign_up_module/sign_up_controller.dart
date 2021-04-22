import 'package:duo_hao/app/data/repository/sign_up_repository.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController{

  final SignUpRepository repository;

  SignUpController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
