import 'package:flutter_test/flutter_test.dart';
import 'package:nectar_store/app.dart';

void main() {
  testWidgets('Nectar Store app starts', (tester) async {
    await tester.pumpWidget(const NectarStoreApp());
    expect(find.byType(NectarStoreApp), findsOneWidget);
  });
}
