import 'package:flapkap_task/core/theming/colors.dart';
import 'package:flapkap_task/core/theming/styles.dart';
import 'package:flapkap_task/modules/orders_graph/presentation/components/trend_summary_view.dart';
import 'package:flapkap_task/modules/orders_graph/presentation/logic/graph_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
class GraphBodyView extends StatelessWidget {
  const GraphBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LineChart(
            _buildLineChartData(context),
          ),
        ),
        20.verticalSpace,
        TrendSummaryView(graphCubit: context.read<GraphCubit>(),),
      ],
    );
  }

  // Build line chart data
  LineChartData _buildLineChartData(BuildContext context) {
    // Safely retrieve monthly order data
    Map<String, int> monthlyOrderData = context.read<GraphCubit>().monthlyOrderDate;

    // Handle empty data scenario
    if (monthlyOrderData.isEmpty) {
      return LineChartData(
        lineBarsData: [], // Empty chart
        titlesData: FlTitlesData(show: false),
      );
    }

    // Sort the monthly data to ensure chronological order
    final sortedEntries = monthlyOrderData.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    // Convert monthly data to spots with proper x-axis mapping
    final spots = sortedEntries.map((entry) {
      // Parse the month from the key to get the correct x-axis position
      final monthParts = entry.key.split('-');
      final monthIndex = int.parse(monthParts[1]) - 1; // Convert to 0-based index

      return FlSpot(monthIndex.toDouble(), entry.value.toDouble());
    }).toList();

    // Calculate max value for y-axis scaling
    final maxValue = monthlyOrderData.values.isNotEmpty
        ? monthlyOrderData.values.reduce((a, b) => a > b ? a : b)
        : 0;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey.withOpacity(0.2),
          strokeWidth: 1,
        ),
        getDrawingVerticalLine: (value) => FlLine(
          color: Colors.grey.withOpacity(0.2),
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              final months = Constant.month;
              return Text(
                months[value.toInt()],
                style: TextStyles.font12GrayMedium,
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: TextStyles.font12GrayMedium,
              );
            },
            reservedSize: 40,
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      minX: 0,
      maxX: 11, // Represent all 12 months
      minY: 0,
      maxY: maxValue * 1.2, // Add 20% padding
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: ColorsManager.mainBlue,
          barWidth: 4.w,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4.w,
                color: ColorsManager.mainBlue,
                strokeWidth: 2.w,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.3),
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.3),
                Colors.blue.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
      extraLinesData: ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: maxValue.toDouble(),
            color: Colors.grey.withOpacity(0.5),
            strokeWidth: 1,
            dashArray: [5, 5],
          ),
        ],
      ),
    );
  }
}
