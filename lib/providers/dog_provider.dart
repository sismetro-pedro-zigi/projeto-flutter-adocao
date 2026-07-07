import 'package:flutter/foundation.dart';

import '../models/dog.dart';
import '../services/pet_service.dart';

/// Gerencia o estado da lista de pets disponiveis para adocao.
///
/// Recebe um [PetService] pelo construtor (injecao de dependencia) e
/// nao sabe qual implementacao concreta esta usando -- pode ser
/// FakePetService ou DogCeoService, o comportamento do provider e o
/// mesmo (Liskov Substitution Principle).
class DogProvider extends ChangeNotifier {
  DogProvider(this._petService);

  final PetService _petService;

  List<Dog> _dogs = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Dog> get dogs => _dogs;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadDogs() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // avisa a tela: "comecei a carregar"

    try {
      _dogs = await _petService.fetchAvailableDogs();
    } catch (e) {
      _errorMessage = 'Não foi possível carregar os pets. Tente novamente.';
    } finally {
      _isLoading = false;
      notifyListeners(); // avisa a tela: "terminei (com ou sem sucesso)"
    }
  }
}
