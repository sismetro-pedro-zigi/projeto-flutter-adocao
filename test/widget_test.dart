import 'package:flutter_test/flutter_test.dart';

import 'package:pet_adoption_app/main.dart';

void main() {
  testWidgets('App inicializa e mostra o titulo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pet Adoption App'), findsOneWidget);
  });
}
