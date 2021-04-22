// To parse this JSON data, do
//
//     final goodsModel = goodsModelFromJson(jsonString);

import 'dart:convert';

GoodsModel goodsModelFromJson(String str) => GoodsModel.fromJson(json.decode(str));

String goodsModelToJson(GoodsModel data) => json.encode(data.toJson());

class GoodsModel {
  GoodsModel({
    this.goodsName,
    this.price,
    this.image,
    this.id,
    this.count,
    this.deletePrice,
    this.subTitle,
  });

  String goodsName;
  String price;
  String image;
  String id;
  String count;
  String deletePrice;
  String subTitle;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
    goodsName: json["goodsName"],
    price: json["price"],
    image: json["image"],
    id: json["id"],
    count: json["count"],
    deletePrice: json["deletePrice"],
    subTitle: json["subTitle"],
  );

  Map<String, dynamic> toJson() => {
    "goodsName": goodsName,
    "price": price,
    "image": image,
    "id": id,
    "count": count,
    "deletePrice": deletePrice,
    "subTitle": subTitle,
  };
}
