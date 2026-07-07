import '../models/dog.dart';
import 'pet_service.dart';

/// Implementacao de [PetService] com dados fixos, sem nenhuma
/// chamada de rede real.
///
/// Usada enquanto a Dog CEO API estiver fora do ar, para continuarmos
/// desenvolvendo o Provider e as telas sem depender de uma API
/// externa instavel. Quando a API real voltar, trocamos para
/// DogCeoService em um unico lugar (main.dart) -- o resto do app nao
/// muda, porque ambas as classes seguem o mesmo contrato PetService
/// (Dependency Inversion + Open/Closed Principle).
class FakePetService implements PetService {
  @override
  Future<List<Dog>> fetchAvailableDogs() async {
    // Simula o tempo de espera de uma requisicao real, para podermos
    // testar o estado de "carregando" nas telas.
    await Future.delayed(const Duration(seconds: 1));

    return const [
      Dog(
        id: 'labrador',
        name: 'Labrador',
        imageUrl: 'https://place.dog/500/400?id=1',
      ),
      Dog(
        id: 'poodle',
        name: 'Poodle',
        imageUrl: 'https://place.dog/500/400?id=2',
      ),
      Dog(
        id: 'bulldog',
        name: 'Bulldog',
        imageUrl: 'https://place.dog/500/400?id=3',
      ),
      Dog(
        id: 'beagle',
        name: 'Beagle',
        imageUrl: 'https://place.dog/500/400?id=4',
      ),
      Dog(
        id: 'akita',
        name: 'Akita',
        imageUrl: 'https://place.dog/500/400?id=5',
      ),
    ];
  }
}
