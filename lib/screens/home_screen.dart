import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dog_provider.dart';
import '../widgets/dog_card.dart';

/// Tela inicial do app: mostra a lista de pets disponiveis para adocao.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dogProvider = context.watch<DogProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Pet Adoption App')),
      body: _buildBody(dogProvider),
    );
  }

  Widget _buildBody(DogProvider dogProvider) {
    if (dogProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (dogProvider.errorMessage != null) {
      return Center(child: Text(dogProvider.errorMessage!));
    }

    return ListView.builder(
      itemCount: dogProvider.dogs.length,
      itemBuilder: (context, index) {
        final dog = dogProvider.dogs[index];
        return DogCard(dog: dog);
      },
    );
  }
}
