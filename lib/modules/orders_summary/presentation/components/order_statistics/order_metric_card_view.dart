import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
class OrderMetricCardView extends StatelessWidget {
  const OrderMetricCardView({super.key, required this.title, required this.value, required this.color});
  final String title;
  final String value;
  final Color color;


    @override
    Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        color: color,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Padding(
      padding:  EdgeInsets.all(16.r),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title, style: TextStyles.font18WhiteMedium,),
      Text(value, style:  TextStyles.font16WhiteMedium,),
      ],
      ),
      ),
      ),
    );
    }
  }

