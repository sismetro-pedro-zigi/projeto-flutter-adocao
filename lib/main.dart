import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/dog_provider.dart';
import 'screens/home_screen.dart';
import 'services/fake_pet_service.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DogProvider(FakePetService())..loadDogs(),
      child: MaterialApp(
        title: 'Pet Adoption App',
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
