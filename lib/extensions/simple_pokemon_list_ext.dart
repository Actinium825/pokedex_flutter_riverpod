import 'package:pokedex_flutter_riverpod/apis/model/simple_pokemon_list.dart';
import 'package:pokedex_flutter_riverpod/extensions/simple_pokemon_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/simple_pokemon_list_dto.dart';

extension SimplePokemonListExt on SimplePokemonList {
  SimplePokemonListDto toDto() => SimplePokemonListDto(
        next: next ?? '',
        simplePokemonList: [...?simplePokemonList?.map((simplePokemonList) => simplePokemonList.toDto())],
      );
}
