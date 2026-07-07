import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/dog.dart';

/// Tela de detalhes de um pet.
///
/// Por enquanto mostra apenas foto (maior) e nome, porque a nossa
/// fonte de dados atual (Dog CEO / FakePetService) nao tem mais
/// informacoes (raca detalhada, idade, descricao). Isso deve
/// melhorar quando migrarmos para a PetFinder API no futuro.
class DogDetailScreen extends StatelessWidget {
  const DogDetailScreen({super.key, required this.dog});

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: dog.imageUrl,
            height: 320,
            fit: BoxFit.cover,
            placeholder: (context, url) => const SizedBox(
              height: 320,
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 320,
              child: Center(child: Icon(Icons.pets, size: 64)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              dog.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
