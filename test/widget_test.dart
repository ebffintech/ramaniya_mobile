import 'package:flutter_test/flutter_test.dart';
import 'package:ramaniya_mobile/main.dart';

void main() {
  testWidgets('Landing screen renders hero headline', (WidgetTester tester) async {
    await tester.pumpWidget(const RamaniyaApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('mutual fund platform'), findsOneWidget);
    expect(find.text('RAMANIYA'), findsOneWidget);
    expect(find.text('Start as an investor'), findsOneWidget);
  });
}
