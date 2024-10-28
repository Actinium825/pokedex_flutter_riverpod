import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';

part 'flavor_text_entry_dto.freezed.dart';

@freezed
class FlavorTextEntryDto with _$FlavorTextEntryDto {
  const factory FlavorTextEntryDto({
    @Default('') String flavorText,
    @Default(PokemonInfoDto()) PokemonInfoDto languageInfo,
  }) = _FlavorTextEntryDto;
}
