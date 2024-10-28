import 'package:pokedex_flutter_riverpod/apis/model/simple_pokemon.dart';
import 'package:pokedex_flutter_riverpod/model/dto/simple_pokemon_dto.dart';

extension SimplePokemonExt on SimplePokemon {
  SimplePokemonDto toDto() => SimplePokemonDto(detailsUrl: detailsUrl ?? '');
}
