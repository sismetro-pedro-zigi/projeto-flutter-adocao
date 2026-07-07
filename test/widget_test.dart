import 'package:flutter_test/flutter_test.dart';

import 'package:pet_adoption_app/main.dart';

void main() {
  testWidgets('App inicializa mostrando a tela de introducao',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Arca de Noé'), findsOneWidget);

    // O FakePetService simula 1s de atraso; avancamos o tempo do teste
    // para o carregamento terminar antes do teste finalizar (mesmo a
    // busca acontecendo em segundo plano, atras da tela de introducao).
    await tester.pump(const Duration(seconds: 1));
  });
}
