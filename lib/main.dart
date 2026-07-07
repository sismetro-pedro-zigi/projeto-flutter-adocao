import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/dog_provider.dart';
import 'screens/home_screen.dart';
import 'services/fake_pet_service.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
