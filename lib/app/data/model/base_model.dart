import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    this.code,
    this.success,
    this.msg,
    this.data,
  });

  String code;
  bool success;
  String msg;
  dynamic data;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
    code: json["code"],
    success: json["success"],
    msg: json["msg"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "msg": msg,
    "data": data,
  };
}
