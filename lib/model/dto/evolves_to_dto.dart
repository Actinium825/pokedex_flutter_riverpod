import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';

part 'evolves_to_dto.freezed.dart';

@freezed
class EvolvesToDto with _$EvolvesToDto {
  const factory EvolvesToDto({
    @Default(PokemonInfoDto()) PokemonInfoDto speciesInfo,
    @Default(<EvolvesToDto>[]) List<EvolvesToDto> evolutions,
  }) = _EvolvesToDto;
}
