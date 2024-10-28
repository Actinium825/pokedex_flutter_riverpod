import 'package:dio/dio.dart';
import 'package:pokedex_flutter_riverpod/apis/apis_client.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_riverpod/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_riverpod/extensions/evolves_to_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_evolution_chain_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_species_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/simple_pokemon_list_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_evolution_chain_dto.dart';
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

  Future<PokemonEvolutionChainDto> getEvolutionChain({required String evolutionChainUrl}) async {
    final response = await apiClient.dio.get<Json>(evolutionChainUrl);
    final evolutionChain = PokemonEvolutionChain.fromJson(response.data!);

    return evolutionChain.toDto();
  }

  Future<List<PokemonDto>> getEvolutionList({required PokemonEvolutionChainDto evolutionChain}) async {
    final futures = <Future<Response<Json>>>[];
    final dio = apiClient.dio;
    final baseUrl = '${apiClient.baseUrl}/pokemon';

    String fetchUrl = '$baseUrl/${evolutionChain.chain.speciesName}';
    futures.add(dio.get(fetchUrl));

    for (final stage2Evolution in evolutionChain.stage2Evolutions) {
      fetchUrl = '$baseUrl/${stage2Evolution.speciesName}';
      futures.add(dio.get(fetchUrl));
    }

    for (final stage3Evolution in evolutionChain.stage3Evolutions) {
      fetchUrl = '$baseUrl/${stage3Evolution.speciesName}';
      futures.add(dio.get(fetchUrl));
    }

    final responses = await Future.wait(futures);
    final evolutionList = <PokemonDto>[];
    final pokemon = Pokemon.fromJson(responses.first.data!);

    evolutionList.add(pokemon.toDto());

    for (final stage2Evolution in responses.sublist(1)) {
      final pokemon = Pokemon.fromJson(stage2Evolution.data!);
      evolutionList.add(pokemon.toDto());
    }

    for (final stage3Evolution in responses.sublist(evolutionList.length)) {
      final pokemon = Pokemon.fromJson(stage3Evolution.data!);
      evolutionList.add(pokemon.toDto());
    }

    return evolutionList;
  }
}
