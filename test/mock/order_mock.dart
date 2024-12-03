import 'package:dartz/dartz.dart';
import 'package:flapkap_task/modules/orders_summary/data/model/order_model.dart';
import 'package:flapkap_task/modules/orders_summary/data/repo/orders_summary_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOrdersSummaryRepo extends Mock implements OrdersSummaryRepository {}

void main() {
  late MockOrdersSummaryRepo mockOrdersSummaryRepo;

  setUp(() {
    // Register the mock class
    mockOrdersSummaryRepo = MockOrdersSummaryRepo();
  });

  group('Mock Test', () {
    test('Mock fetchOrders returns a successful result', () async {
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
      ];

      // Mock the fetchOrders method to return a successful result
      when(() => mockOrdersSummaryRepo.fetchOrders())
          .thenAnswer((_) async => Right(orderModels));

      // Fetch orders using the mock repository
      final result = await mockOrdersSummaryRepo.fetchOrders();

      // Assert that the result is of type Right and contains the correct data
      expect(result, isA<Right<String, List<OrderModel>>>());
      expect(result.getOrElse(() => []), isNotEmpty);
      expect(result.getOrElse(() => []).first.company, 'Company A');
    });

    test('Mock fetchOrders returns a failure', () async {
      final failureMessage = 'can\'t load data';

      // Mock the fetchOrders method to return a failure result
      when(() => mockOrdersSummaryRepo.fetchOrders())
          .thenAnswer((_) async => Left(failureMessage));

      // Fetch orders using the mock repository
      final result = await mockOrdersSummaryRepo.fetchOrders();

      // Assert that the result is of type Left and contains the correct error message
      expect(result, isA<Left<String, List<OrderModel>>>());
      expect(result.getOrElse(() => []), isEmpty);
      expect(result.fold((l) => l, (r) => ''), failureMessage);
    });
  });
}
