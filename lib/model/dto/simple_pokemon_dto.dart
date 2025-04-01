import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_pokemon_dto.freezed.dart';

@freezed
sealed class SimplePokemonDto with _$SimplePokemonDto {
  const factory SimplePokemonDto({
    @Default('') String detailsUrl,
  }) = _SimplePokemonDto;
}
