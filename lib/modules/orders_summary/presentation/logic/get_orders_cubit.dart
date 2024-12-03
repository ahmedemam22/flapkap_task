import 'package:flapkap_task/core/bloc/base_state.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/repo/orders_summary_repo.dart';
@injectable
class GetOrdersCubit extends Cubit<BaseState<List<OrderModel>>> {
  final OrdersSummaryRepository _ordersSummaryRepo;
  GetOrdersCubit(this._ordersSummaryRepo) :   super(const BaseState());
  int totalCount = 0;
  double totalPrice = 0;
  double averagePrice = 0;
  int returnCount = 0;
  void execute() async {

    emit(state.setInProgressState());
    final  result = await _ordersSummaryRepo.fetchOrders();
    result.fold(
            (l) => emit(state.setFailureState(l)),
          (r) {
            calculateOrderStatistics(r);
                emit(state.setSuccessState(r));
          });}

  calculateOrderStatistics(List<OrderModel>orders){
    // Calculate total count, average price, and returns
totalCount=orders.length;
    for (var order in orders) {
      double price = double.parse(order.price.replaceAll(RegExp(r'[^\d.]'), ''));
      totalPrice += price;

      if (order.status == 'RETURNED') {
        returnCount++;
      }
    }

     averagePrice = totalCount > 0 ? totalPrice / totalCount : 0;
  }



}