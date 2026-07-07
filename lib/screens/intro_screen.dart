import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'pets_screen.dart';

/// Tela de abertura do app: apresenta a ONG Arca de Noe (Marechal
/// Candido Rondon - PR), que serviu de inspiracao para este projeto
/// de estudo. Nao ha vinculo, parceria ou autorizacao oficial da
/// instituicao -- ver aviso no final da tela e no README.
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 220,
                  semanticLabel: 'Logo da ONG Arca de Noé',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Marechal Cândido Rondon - PR',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Desde 2006, um grupo de voluntários sensibilizados com o '
                'abandono e os maus-tratos de animais domésticos atua no '
                'resgate, na castração e na busca por lares para cães e '
                'gatos em situação de rua na região de Marechal Cândido '
                'Rondon (PR).',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.pets,
                      number: '4.730',
                      label: 'animais resgatados',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.medical_services,
                      number: '4.530',
                      label: 'castrações realizadas',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const _StatCard(
                icon: Icons.favorite,
                number: '3.780',
                label: 'cães e gatos adotados',
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Este aplicativo é um projeto de estudo, sem qualquer '
                  'vínculo, parceria ou autorização oficial da ONG Arca de '
                  'Noé. Foi desenvolvido apenas para fins educacionais.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Fica fixo no rodape da tela, fora da area de rolagem, para que
      // o usuario sempre consiga tocar nele, mesmo tendo rolado para
      // ler o conteudo acima.
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppTheme.warmAccent,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PetsScreen()),
              );
            },
            child: const Text('Ver pets disponíveis para adoção'),
          ),
        ),
      ),
    );
  }
}

/// Cartao visual usado para destacar um numero/estatistica da ONG.
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.number,
    required this.label,
  });

  final IconData icon;
  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: colorScheme.onSecondaryContainer),
          const SizedBox(height: 8),
          Text(
            number,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondaryContainer,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
