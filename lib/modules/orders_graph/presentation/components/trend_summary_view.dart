import 'package:flapkap_task/modules/orders_graph/presentation/components/summary_row_view.dart';
import 'package:flapkap_task/modules/orders_graph/presentation/logic/graph_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
class TrendSummaryView extends StatelessWidget {
final GraphCubit graphCubit;

  const TrendSummaryView({super.key, required this.graphCubit});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trend Summary',
              style: TextStyles.font14DarkBlueMedium
            ),
           10.verticalSpace,
            SummaryRowView(label:'Total Orders', value:graphCubit.totalOrders.toInt().toString()),
            SummaryRowView(label:'Avg. Monthly Orders',value: graphCubit.averageMonthlyOrders.toStringAsFixed(1)),
            SummaryRowView(label:'Peak Month', value:'${graphCubit.maxOrderMonth.key} (${graphCubit.maxOrderMonth.value} orders)'),
            SummaryRowView(label:'Lowest Month', value:'${graphCubit.minOrderMonth.key} (${graphCubit.minOrderMonth.value} orders)'),
          ],
        ),
      ),
    );;
  }
}
