import 'package:flutter_test/flutter_test.dart';

import 'package:pet_adoption_app/main.dart';

void main() {
  testWidgets('App inicializa e mostra o titulo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pet Adoption App'), findsOneWidget);

    // O FakePetService simula 1s de atraso; avancamos o tempo do teste
    // para o carregamento terminar antes do teste finalizar.
    await tester.pump(const Duration(seconds: 1));
  });
}
