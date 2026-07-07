import 'package:flutter/material.dart';

/// Tema visual do app, inspirado na ONG Arca de Noe (Marechal Candido
/// Rondon-PR), usada como referencia de estudo para este projeto (sem
/// vinculo oficial com a instituicao).
///
/// O azul petroleo remete a agua/arca e transmite confianca. O laranja
/// e reservado para acoes de acolhimento (ex: favoritar).
class AppTheme {
  AppTheme._();

  static const _seedColor = Color(0xFF0D6E6E);
  static const warmAccent = Color(0xFFFF8A50);

  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
      useMaterial3: true,
    );
  }
}
