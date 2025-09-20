import 'package:pokedex_flutter_riverpod/apis/apis_client.dart';
import 'package:pokedex_flutter_riverpod/apis/pokemon_api.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_api_provider.g.dart';

@riverpod
PokemonApi pokemonApi(Ref ref) {
  final apiClient = ApiClient(baseUrl);
  return PokemonApi(apiClient);
}
