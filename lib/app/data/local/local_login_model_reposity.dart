import 'dart:convert';

import 'package:duo_hao/app/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalLoginModelRepository {
  static final String keyLoginModel = 'key_login_model';

  static saveLoginModel(LoginModel bean) {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(keyLoginModel, jsonEncode(bean.toJson()));
  }

  static LoginModel getLoginModel() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(keyLoginModel);
      return LoginModel.fromJson(jsonDecode(json));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
