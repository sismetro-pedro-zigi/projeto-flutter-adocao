import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/dog.dart';
import 'pet_service.dart';

/// Implementacao de [PetService] que busca dados na Dog CEO API
/// (https://dog.ceo/dog-api/), uma API publica e gratuita, sem
/// autenticacao, usada aqui apenas para fins de aprendizado.
///
/// A Dog CEO API nao tem o conceito de "animal individual disponivel
/// para adocao" -- ela so retorna racas e fotos aleatorias. Por isso,
/// tratamos cada raca como se fosse um "pet": o nome da raca vira o
/// nome do pet, e uma foto aleatoria daquela raca vira sua imagem.
class DogCeoService implements PetService {
  static const _baseUrl = 'https://dog.ceo/api';

  /// Quantidade de racas buscadas por chamada. A API tem mais de 100
  /// racas cadastradas; limitamos para nao disparar uma quantidade
  /// enorme de requisicoes HTTP de uma vez so.
  static const _breedLimit = 20;

  @override
  Future<List<Dog>> fetchAvailableDogs() async {
    final breedNames = await _fetchBreedNames();
    final limitedBreedNames = breedNames.take(_breedLimit);

    // Busca a imagem de cada raca em paralelo (em vez de uma de cada
    // vez, sequencialmente), o que deixa o carregamento bem mais rapido.
    final dogs = await Future.wait(
      limitedBreedNames.map((breedName) async {
        final imageUrl = await _fetchRandomImageForBreed(breedName);
        return Dog(
          id: breedName,
          name: _capitalize(breedName),
          imageUrl: imageUrl,
        );
      }),
    );

    return dogs;
  }

  Future<List<String>> _fetchBreedNames() async {
    final response = await http.get(Uri.parse('$_baseUrl/breeds/list/all'));

    if (response.statusCode != 200) {
      throw Exception(
        'Falha ao buscar lista de racas: ${response.statusCode}',
      );
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final message = body['message'] as Map<String, dynamic>;
    return message.keys.toList();
  }

  Future<String> _fetchRandomImageForBreed(String breedName) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/breed/$breedName/images/random'),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Falha ao buscar imagem da raca $breedName: ${response.statusCode}',
      );
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body['message'] as String;
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
