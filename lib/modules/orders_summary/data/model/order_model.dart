// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'order_model.g.dart';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "isActive")
  bool isActive;
  @JsonKey(name: "price")
  String price;
  @JsonKey(name: "company")
  String company;
  @JsonKey(name: "picture")
  String picture;
  @JsonKey(name: "buyer")
  String buyer;
  @JsonKey(name: "tags")
  List<String> tags;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "registered")
  String registered;

  OrderModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
  factory OrderModel.getDummyData() => OrderModel(id: '1111111111', isActive: true, price: '5', company: 'loading..', picture: 'picture', buyer: 'buyer', tags: [], status: 'status', registered: 'registered');

}
