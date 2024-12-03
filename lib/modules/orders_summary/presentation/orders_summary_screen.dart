import 'package:flapkap_task/core/bloc/base_state.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/orders_body_view.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/order_statistics/orders_statistics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theming/styles.dart';
import 'logic/get_orders_cubit.dart';

class OrdersSummaryScreen extends StatefulWidget {
  const OrdersSummaryScreen({super.key});

  @override
  State<OrdersSummaryScreen> createState() => _OrdersSummaryScreenState();
}

class _OrdersSummaryScreenState extends State<OrdersSummaryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Summary',style: TextStyles.font18DarkBlueBold,),
      ),
      body:BlocBuilder<GetOrdersCubit, BaseState<List<OrderModel>>>(
        builder: (context, state) {
          return Skeletonizer(
              enabled: state.status == BaseStatus.initial||state.status == BaseStatus.inProgress,
              child: const OrdersBodyView());
        } ),
    );
  }
}



