import 'package:pokedex_flutter_riverpod/apis/apis_client.dart';
import 'package:pokedex_flutter_riverpod/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_riverpod/extensions/simple_pokemon_list_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/simple_pokemon_list_dto.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<SimplePokemonListDto> getSimplePokemonList({String? nextPageUrl}) async {
    final fetchUrl = nextPageUrl ?? '${apiClient.baseUrl}/pokemon';
    final response = await apiClient.dio.get<Json>(fetchUrl);
    final simplePokemonList = SimplePokemonList.fromJson(response.data!);

    return simplePokemonList.toDto();
  }
}
