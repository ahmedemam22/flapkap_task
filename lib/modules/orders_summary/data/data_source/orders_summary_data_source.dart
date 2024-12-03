import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../generated/assets.dart';

abstract class OrdersSummaryDataSource{
  Future<Either<String,List<OrderModel>>> fetchOrders();

}
@LazySingleton(as: OrdersSummaryDataSource)
class OrdersSummaryDataSourceImpl implements OrdersSummaryDataSource {
  @override
  Future<Either<String, List<OrderModel>>> fetchOrders() async {
    List<OrderModel> orders = [];
    try {
      String jsonString = await rootBundle.loadString(Assets.assetsJsonData);
      List<dynamic> data = json.decode(jsonString);

      orders = data.map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      return Left('can\'t load data');
    }
    return Right(orders);
  }

  }

