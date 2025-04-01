import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/simple_pokemon_dto.dart';

part 'simple_pokemon_list_dto.freezed.dart';

@freezed
sealed class SimplePokemonListDto with _$SimplePokemonListDto {
  const factory SimplePokemonListDto({
    @Default('') String next,
    @Default(<SimplePokemonDto>[]) List<SimplePokemonDto> simplePokemonList,
  }) = _SimplePokemonListDto;
}
