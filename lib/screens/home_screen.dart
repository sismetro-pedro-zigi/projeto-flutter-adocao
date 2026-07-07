import 'package:flutter/material.dart';

/// Tela inicial do app.
///
/// Por enquanto é apenas um placeholder. Na proxima feature ela vai
/// mostrar a lista de animais disponiveis para adocao, vinda da
/// Dog CEO API.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet Adoption App')),
      body: const Center(child: Text('Em construção..')),
    );
  }
}
