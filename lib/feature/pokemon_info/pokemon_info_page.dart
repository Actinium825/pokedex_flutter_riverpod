import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/feature/pokemon_info/info_scaffold.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';

class PokemonInfoPage extends ConsumerWidget {
  const PokemonInfoPage({super.key});

  static const route = 'pokemon-info';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InfoScaffold(
      color: ref.read(selectedPokemonProvider).primaryColor,
      children: const [],
    );
  }
}
