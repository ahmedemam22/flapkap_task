import 'package:flapkap_task/modules/orders_graph/presentation/components/graph_body_view.dart';
import 'package:flapkap_task/modules/orders_graph/presentation/logic/graph_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/styles.dart';
import '../../orders_summary/data/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersGraphScreen extends StatefulWidget {
  final List<OrderModel> orders;

  const OrdersGraphScreen({Key? key, required this.orders}) : super(key: key);

  @override
  State<OrdersGraphScreen> createState() => _OrdersGraphScreenState();
}

class _OrdersGraphScreenState extends State<OrdersGraphScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GraphCubit>().calculateTrend(widget.orders);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Graph',style:  TextStyles.font18DarkBlueBold,),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Monthly Order Volume',
              style:  TextStyles.font18DarkBlueBold,
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
           Expanded(child: const GraphBodyView())
          ],
        ),
      ),
    );
  }
}