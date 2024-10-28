import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/simple_pokemon_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonList extends _$PokemonList {
  @override
  Future<List<PokemonDto>> build() async {
    await ref.watch(simplePokemonListProvider.notifier).getSimplePokemonList();

    final simplePokemonList = ref.read(simplePokemonListProvider).simplePokemonList;
    final receivedPokemonList = await ref.read(pokemonApiProvider).getPokemonList(simplePokemonList: simplePokemonList);

    return receivedPokemonList;
  }
}
