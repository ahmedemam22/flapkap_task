import 'package:flapkap_task/core/routes/app_router.dart';
import 'package:flapkap_task/core/theming/colors.dart';
import 'package:flapkap_task/core/widgets/app_text_btn.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/order_statistics/orders_statistics_view.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/recent_orders/recent_orders_view.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/logic/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/styles.dart';
class OrdersBodyView extends StatelessWidget {
  const OrdersBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: Column(
        children: [
          RecentOrdersView(),
          20.verticalSpace,

          Flexible(child: OrdersStatisticsView()),
          Expanded(child: Align(
              alignment: Alignment.bottomCenter,
              child: AppTextButton(buttonText: 'Display Graph', textStyle: TextStyles.font16WhiteMedium, onPressed: ()=>Navigator.pushNamed(context,Routes.orderChartScreen,arguments: context.read<GetOrdersCubit>().state.item))))

        ],
      ),
    );
  }
}
