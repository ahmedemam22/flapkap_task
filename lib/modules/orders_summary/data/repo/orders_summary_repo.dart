import 'package:dartz/dartz.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import '../data_source/orders_summary_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class OrdersSummaryRepository {
  OrdersSummaryRepository(this._ordersSummaryService);

  final OrdersSummaryDataSource _ordersSummaryService;

  Future<Either<String, List<OrderModel>>> fetchOrders();
}

@LazySingleton(as: OrdersSummaryRepository)
class OrdersSummaryRepositoryImpl extends OrdersSummaryRepository {
  OrdersSummaryRepositoryImpl(super.ordersSummaryService);

  @override
  Future<Either<String, List<OrderModel>>> fetchOrders() async {
    Either<String, List<OrderModel>> ordersResult = await _ordersSummaryService.fetchOrders();
    return ordersResult.fold((l) => Left(l), (r) => Right(r));
  }
}