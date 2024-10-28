import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_info_dto.freezed.dart';

@freezed
class PokemonInfoDto with _$PokemonInfoDto {
  const factory PokemonInfoDto({
    @Default('') String name,
    @Default('') String detailsUrl,
  }) = _PokemonInfoDto;
}
