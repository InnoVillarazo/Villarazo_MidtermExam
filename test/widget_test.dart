import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_app/main.dart';

void main() {
  testWidgets('Splash screen shows WELCOME text', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const CatfolioApp());

    // Verify splash page contains WELCOME text
    expect(find.text('WELCOME'), findsOneWidget);
  });

  testWidgets('Continue button is present on splash screen',
      (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const CatfolioApp());

    // Verify "Continue" button exists
    expect(find.text('Continue'), findsOneWidget);
  });
}
