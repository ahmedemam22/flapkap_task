
import 'package:flapkap_task/core/routes/app_router.dart';
import 'package:flapkap_task/task_app.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget( TaskApp(appRouter: AppRouter(),));

  });
}
