import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_evolution_chain_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_evolution_list_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_species_provider.dart';

final pokemonInfoPageProvider = FutureProvider.autoDispose((ref) async {
  final selectedPokemon = ref.read(selectedPokemonProvider);
  final speciesUrl = selectedPokemon.speciesInfo.detailsUrl;

  await ref.watch(pokemonSpeciesProvider.notifier).getSpecies(speciesUrl: speciesUrl);
  await ref.watch(pokemonEvolutionChainProvider.notifier).getEvolutionChain();
  await ref.watch(pokemonEvolutionListProvider.notifier).getEvolutionList();
});
