import 'package:pokedex_flutter_riverpod/model/dto/pokemon_species_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_species_provider.g.dart';

@riverpod
class PokemonSpecies extends _$PokemonSpecies {
  @override
  PokemonSpeciesDto build() => const PokemonSpeciesDto();

  Future<void> getSpecies({required String speciesUrl}) async {
    final species = await ref.read(pokemonApiProvider).getSpecies(speciesUrl: speciesUrl);
    state = species;
  }
}
