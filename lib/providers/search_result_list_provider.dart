import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_dto.dart';
import 'package:pokedex_flutter_riverpod/providers/pokemon_api_provider.dart';

final searchResultListProvider = FutureProvider.autoDispose.family<List<PokemonDto>, String>(
    (ref, pokemonName) async => ref.read(pokemonApiProvider).searchPokemon(pokemonName: pokemonName.trim()));
