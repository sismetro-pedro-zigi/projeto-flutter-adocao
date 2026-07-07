import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dog_provider.dart';
import '../widgets/dog_card.dart';
import 'dog_detail_screen.dart';

/// Tela que mostra a lista de pets disponiveis para adocao.
class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dogProvider = context.watch<DogProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Pet Adoption App')),
      body: _buildBody(context, dogProvider),
    );
  }

  Widget _buildBody(BuildContext context, DogProvider dogProvider) {
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
        return DogCard(
          dog: dog,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DogDetailScreen(dog: dog)),
            );
          },
        );
      },
    );
  }
}
