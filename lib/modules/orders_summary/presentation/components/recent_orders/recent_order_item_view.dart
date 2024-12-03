import 'package:flapkap_task/core/theming/colors.dart';
import 'package:flapkap_task/core/theming/styles.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/components/recent_orders/rounded_text_card_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class RecentOrderItemView extends StatelessWidget {
  const RecentOrderItemView({super.key, required this.order});
final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,

      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
      shape: RoundedRectangleBorder(
        
          borderRadius: BorderRadius.circular(10.r),


      ),
      child: Padding(
        padding:  EdgeInsets.only(right:30.w,left: 16.w,top: 10.h,bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #${order.id.substring(0, 8)}', style: TextStyles.font14DarkBlueMedium),
            5.verticalSpace,
            Text(
              order.buyer, style:TextStyles.font14GrayRegular),
            5.verticalSpace,
            Text(
              '${order.price}', style: TextStyles.font14DarkBlueMedium.copyWith(color: ColorsManager.lightGreen)
            ),
           5.verticalSpace,
           RoundedTextCardView(title:  order.status.toString().split('.').last.toUpperCase())
          ],
        ),
      ),
    );;
  }
}
