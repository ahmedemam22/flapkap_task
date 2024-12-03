import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flapkap_task/modules/orders_summary/presentation/logic/get_orders_cubit.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flapkap_task/core/bloc/base_state.dart';
import 'mock/order_mock.dart'; // Import the mock repository

void main() {
  late MockOrdersSummaryRepo mockOrdersSummaryRepo;
  late GetOrdersCubit ordersCubit;

  setUp(() {
    mockOrdersSummaryRepo = MockOrdersSummaryRepo();
    ordersCubit = GetOrdersCubit(mockOrdersSummaryRepo);

    when(() => mockOrdersSummaryRepo.fetchOrders())
        .thenAnswer((_) async => Right<String, List<OrderModel>>([
      OrderModel(
        id: '1',
        isActive: true,
        price: '100',
        company: 'Company A',
        picture: '',
        buyer: 'Buyer A',
        tags: [],
        status: 'Completed',
        registered: '2024-01-01',
      ),
    ]));
  });

  group('GetOrdersCubit Tests', () {
    test('initial state is correct', () {
      expect(ordersCubit.state.status, BaseStatus.initial);
    });

    test('should emit [inProgress, success] when data is fetched successfully', () async {
      ordersCubit.execute();

      expect(ordersCubit.state.status, BaseStatus.inProgress);

      await Future.delayed(Duration(seconds: 1));

      expect(ordersCubit.state.status, BaseStatus.success);
      expect(ordersCubit.state.item?.first.company, 'Company A');
    });

    test('should emit [inProgress, failure] when there is an error fetching data', () async {
      when(() => mockOrdersSummaryRepo.fetchOrders())
          .thenAnswer((_) async => Left<String, List<OrderModel>>('Failed to load orders'));

      ordersCubit.execute();

      expect(ordersCubit.state.status, BaseStatus.inProgress);

      await Future.delayed(Duration(seconds: 1));

      expect(ordersCubit.state.status, BaseStatus.failure);
      expect(ordersCubit.state.failure, 'Failed to load orders');
    });

    test('should correctly calculate order statistics', () async {
      final orderModels = [
        OrderModel(
          id: '1',
          isActive: true,
          price: '100',
          company: 'Company A',
          picture: '',
          buyer: 'Buyer A',
          tags: [],
          status: 'Completed',
          registered: '2024-01-01',
        ),
        OrderModel(
          id: '2',
          isActive: true,
          price: '150',
          company: 'Company B',
          picture: '',
          buyer: 'Buyer B',
          tags: [],
          status: 'RETURNED',
          registered: '2024-01-01',
        ),
      ];

      when(() => mockOrdersSummaryRepo.fetchOrders())
          .thenAnswer((_) async => Right<String, List<OrderModel>>(orderModels));

      ordersCubit.execute();

      await Future.delayed(Duration(seconds: 1));

      expect(ordersCubit.totalCount, 2);
      expect(ordersCubit.totalPrice, 250); // 100 + 150
      expect(ordersCubit.averagePrice, 125); // (100 + 150) / 2
      expect(ordersCubit.returnCount, 1); // 1 returned item
    });
  });
}
