import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/selected_pokemon_provider.dart';

final selectedPokemonSpeciesProvider = FutureProvider.autoDispose((ref) async {
  final selectedPokemon = ref.read(selectedPokemonProvider);
  final speciesUrl = selectedPokemon.speciesInfo.detailsUrl;

  return ref.read(pokemonApiProvider).getSpecies(speciesUrl: speciesUrl);
});
