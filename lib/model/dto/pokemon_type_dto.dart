import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';

part 'pokemon_type_dto.freezed.dart';

@freezed
class PokemonTypeDto with _$PokemonTypeDto {
  const factory PokemonTypeDto({
    @Default(0) int slot,
    @Default(PokemonInfoDto()) PokemonInfoDto typeInfo,
  }) = _PokemonTypeDto;
}
