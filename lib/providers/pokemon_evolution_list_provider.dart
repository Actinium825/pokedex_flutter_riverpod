import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_evolution_chain_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_evolution_list_provider.g.dart';

@riverpod
class PokemonEvolutionList extends _$PokemonEvolutionList {
  @override
  List<PokemonDto> build() => List.empty();

  Future<void> getEvolutionList() async {
    final evolutionChain = ref.read(pokemonEvolutionChainProvider);
    final evolutionList = await ref.read(pokemonApiProvider).getEvolutionList(evolutionChain: evolutionChain);

    state = evolutionList;
  }
}
