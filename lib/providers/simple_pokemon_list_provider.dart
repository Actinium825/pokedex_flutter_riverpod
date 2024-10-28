import 'package:pokedex_flutter_riverpod/model/dto/simple_pokemon_list_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simple_pokemon_list_provider.g.dart';

@riverpod
class SimplePokemonList extends _$SimplePokemonList {
  @override
  SimplePokemonListDto build() => const SimplePokemonListDto();

  Future<void> getSimplePokemonList({String? nextPageUrl}) async {
    final simplePokemonList = await ref.read(pokemonApiProvider).getSimplePokemonList(nextPageUrl: nextPageUrl);
    state = simplePokemonList;
  }
}
