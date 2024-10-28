import 'package:pokedex_flutter_riverpod/apis/apis_client.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_riverpod/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/simple_pokemon_list_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_species_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/simple_pokemon_dto.dart';
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

  Future<List<PokemonDto>> getPokemonList({required List<SimplePokemonDto> simplePokemonList}) async {
    final dio = apiClient.dio;

    final futures = simplePokemonList.map((simplePokemon) {
      final url = simplePokemon.detailsUrl;
      final response = dio.get<Json>(url);
      return response;
    });

    final responses = await Future.wait(futures);

    return responses.map((response) => Pokemon.fromJson(response.data!).toDto()).toList();
  }

  Future<List<PokemonDto>> searchPokemon({required String pokemonName}) async {
    final baseUrl = apiClient.baseUrl;
    final fetchUrl = '$baseUrl/pokemon/$pokemonName';

    final response = await apiClient.dio.get<Json>(fetchUrl);
    final pokemon = Pokemon.fromJson(response.data!);

    return [pokemon.toDto()];
  }

  Future<PokemonSpeciesDto> getSpecies({required String speciesUrl}) async {
    final response = await apiClient.dio.get<Json>(speciesUrl);
    final pokemonSpecies = PokemonSpecies.fromJson(response.data!);

    return pokemonSpecies.toDto();
  }
}
