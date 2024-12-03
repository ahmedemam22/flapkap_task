
import 'package:flapkap_task/modules/orders_graph/presentation/logic/graph_cubit.dart';
import 'package:flapkap_task/modules/orders_summary/data/data_source/orders_summary_data_source.dart';
import 'package:flapkap_task/modules/orders_summary/data/repo/orders_summary_repo.dart';
import 'package:get_it/get_it.dart';

import '../../modules/orders_summary/presentation/logic/get_orders_cubit.dart';





final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  //orders
  getIt.registerLazySingleton<OrdersSummaryDataSource>(() => OrdersSummaryDataSourceImpl());
  getIt.registerLazySingleton<OrdersSummaryRepository>(() => OrdersSummaryRepositoryImpl(getIt()));
  getIt.registerFactory<GetOrdersCubit>(() => GetOrdersCubit(getIt()));
//orders graph
  getIt.registerFactory<GraphCubit>(() => GraphCubit());

}