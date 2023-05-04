import 'package:flutter_template/app/data/repository/profile_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ProfileController extends GetxController{

  final ProfileRepository? repository;

  ProfileController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
