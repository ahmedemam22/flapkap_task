import 'package:flapkap_task/core/bloc/base_state.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:injectable/injectable.dart';

@injectable

class GraphCubit extends Cubit<BaseState<bool>> {
  GraphCubit() :   super(const BaseState());
  //statistics properties
  double totalOrders=0;
  double averageMonthlyOrders=0;
  late MapEntry<String, int> maxOrderMonth;
  late MapEntry<String, int> minOrderMonth;
  late Map<String, int> monthlyOrderDate;

  void calculateTrend(List<OrderModel>orders) async {
    emit(state.setInProgressState());
    _groupOrdersByMonth(orders);
    totalOrders = monthlyOrderDate.values.fold(0, (a, b) => a + b);
    averageMonthlyOrders = totalOrders / monthlyOrderDate.length;

    // Find max and min months
    maxOrderMonth = monthlyOrderDate.entries.reduce((a, b) =>
    a.value > b.value ? a : b);
    minOrderMonth = monthlyOrderDate.entries.reduce((a, b) =>
    a.value < b.value ? a : b);

  }
  Map<String, int> _groupOrdersByMonth(List<OrderModel> orders) {
    // Parse registered dates and group
    monthlyOrderDate = {};

    for (var order in orders) {
      try {
        // Parse the registered date
        DateTime registeredDate = DateTime.parse(order.registered);

        // Format to 'yyyy-MM' for grouping
        String monthKey = DateFormat('yyyy-MM').format(registeredDate);

        // Increment order count for the month
        monthlyOrderDate[monthKey] = (monthlyOrderDate[monthKey] ?? 0) + 1;
      } catch (e) {
        print('Error parsing date: ${order.registered}');
      }
    }

    return monthlyOrderDate;
  }





}