import '../models/dog.dart';

/// Contrato que qualquer fonte de dados de pets precisa seguir.
///
/// O Provider e as telas dependem apenas desta abstracao (Dependency
/// Inversion Principle), nunca de uma implementacao concreta como
/// DogCeoService. Isso permite trocar a fonte de dados (ex: migrar
/// para a PetFinder API no futuro) sem alterar nada fora da camada
/// de services (Open/Closed Principle).
abstract class PetService {
  Future<List<Dog>> fetchAvailableDogs();
}
