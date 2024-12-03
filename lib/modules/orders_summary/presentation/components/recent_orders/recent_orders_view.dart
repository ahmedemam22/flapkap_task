import 'package:flapkap_task/core/theming/styles.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/recent_orders/recent_order_item_view.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/logic/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/order_model.dart';
class RecentOrdersView extends StatelessWidget {
   RecentOrdersView({super.key});
late GetOrdersCubit _ordersCubit;
  @override
  Widget build(BuildContext context) {
    _ordersCubit=context.read<GetOrdersCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Orders',style: TextStyles.font18DarkBlueBold,),
        10.verticalSpace,
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: List.generate(3, (index){
              return RecentOrderItemView(order:_ordersCubit.state.item!=null&&_ordersCubit.state.item!.length>3?_ordersCubit.state.item![index] :OrderModel.getDummyData());
          
            })
          
          
          
            ,),
          ),
       10.verticalSpace

      ],
    );
  }
}
