import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';

part 'pokemon_move_dto.freezed.dart';

@freezed
class PokemonMoveDto with _$PokemonMoveDto {
  const factory PokemonMoveDto({
    @Default(PokemonInfoDto()) PokemonInfoDto moveInfo,
  }) = _PokemonMoveDto;
}
