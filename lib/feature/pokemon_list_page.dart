import 'package:flutter/material.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pokedex'),
      ),
    );
  }
}
