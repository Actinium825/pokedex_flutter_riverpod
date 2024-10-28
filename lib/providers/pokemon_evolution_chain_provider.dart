import 'package:pokedex_flutter_riverpod/model/dto/pokemon_evolution_chain_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_species_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_evolution_chain_provider.g.dart';

@riverpod
class PokemonEvolutionChain extends _$PokemonEvolutionChain {
  @override
  PokemonEvolutionChainDto build() => const PokemonEvolutionChainDto();

  Future<void> getEvolutionChain() async {
    final pokemonSpecies = ref.read(pokemonSpeciesProvider);
    final evolutionChainUrl = pokemonSpecies.evolutionChainInfo.url;
    final evolutionChain = await ref.read(pokemonApiProvider).getEvolutionChain(evolutionChainUrl: evolutionChainUrl);

    state = evolutionChain;
  }
}
