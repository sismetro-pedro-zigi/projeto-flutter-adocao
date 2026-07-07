import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/dog.dart';

/// Cartao visual de um pet disponivel para adocao.
///
/// Widget reutilizavel: hoje e usado na PetsScreen, mas pode ser
/// reaproveitado em outras telas (ex: lista de favoritos) sem
/// duplicar codigo.
class DogCard extends StatelessWidget {
  const DogCard({super.key, required this.dog, this.onTap});

  final Dog dog;

  /// Chamado quando o card e tocado. O card nao sabe (nem precisa
  /// saber) o que acontece no toque -- quem decide e quem o utiliza.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: dog.imageUrl,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            // Mostrado enquanto a imagem esta sendo baixada.
            placeholder: (context, url) => const SizedBox(
              width: 64,
              height: 64,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            // Mostrado se a imagem falhar ao carregar.
            errorWidget: (context, url, error) => const SizedBox(
              width: 64,
              height: 64,
              child: Icon(Icons.pets),
            ),
          ),
        ),
        title: Text(dog.name),
      ),
    );
  }
}
