import 'package:flapkap_task/core/routes/routes.dart';
import 'package:flapkap_task/modules/orders_graph/presentation/logic/graph_cubit.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/orders_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/orders_summary/presentation/logic/get_orders_cubit.dart';
import '../../modules/orders_graph/presentation/order_graph_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {

      case Routes.ordersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<GetOrdersCubit>(
    create: (BuildContext context) => getIt<GetOrdersCubit>()..execute(),
    child:  const OrdersSummaryScreen(),

        ));
      case Routes.orderChartScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider<GraphCubit>(
          create: (BuildContext context) => getIt<GraphCubit>(),child:OrdersGraphScreen(orders: settings.arguments as List<OrderModel>
          ),

        ));


      default:
        return null;
    }
  }
}