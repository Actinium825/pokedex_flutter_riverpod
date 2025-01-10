import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/loading_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';
import 'package:pokedex_flutter_riverpod/providers/simple_pokemon_list_provider.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PokemonList extends _$PokemonList {
  @override
  Future<List<PokemonDto>> build() async {
    await initPokemonListPage();
    return [...?state.value];
  }

  Future<void> initPokemonListPage() async {
    state = const AsyncLoading();

    await ref.watch(simplePokemonListProvider.notifier).getSimplePokemonList();

    final simplePokemonList = ref.read(simplePokemonListProvider).simplePokemonList;
    final receivedPokemonList = await ref.read(pokemonApiProvider).getPokemonList(simplePokemonList: simplePokemonList);

    state = AsyncValue.data(receivedPokemonList);
  }

  void getMorePokemon() async {
    ref.read(loadingProvider.notifier).setLoadingKey(getMorePokemonKey);

    final nextPageUrl = ref.read(simplePokemonListProvider).next;

    await ref.watch(simplePokemonListProvider.notifier).getSimplePokemonList(nextPageUrl: nextPageUrl);

    final simplePokemonList = ref.read(simplePokemonListProvider).simplePokemonList;
    final receivedPokemonList = await ref.read(pokemonApiProvider).getPokemonList(simplePokemonList: simplePokemonList);

    state = AsyncValue.data([...?state.value?.followedBy(receivedPokemonList)]);

    ref.read(loadingProvider.notifier).clear();
  }
}
