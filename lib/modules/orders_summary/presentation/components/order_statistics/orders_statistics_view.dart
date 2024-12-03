import 'package:flapkap_task/core/theming/colors.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/order_statistics/order_metric_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../logic/get_orders_cubit.dart';
class OrdersStatisticsView extends StatelessWidget {
   OrdersStatisticsView({super.key});
late GetOrdersCubit _ordersCubit;
  @override
  Widget build(BuildContext context) {
    _ordersCubit=context.read<GetOrdersCubit>();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Statistics',style: TextStyles.font18DarkBlueBold,),

      OrderMetricCardView(   title: 'Total Orders', value: _ordersCubit.totalCount.toString(),color: ColorsManager.mainBlue,),
        OrderMetricCardView(title: 'Average Price', value: '\$${_ordersCubit.averagePrice.toStringAsFixed(2)}',color: ColorsManager.lightGreen,),
        OrderMetricCardView( title: 'Number of Returns', value: _ordersCubit.returnCount.toString(),color: ColorsManager.darkBlue,),
      ],
    );
  }
}
