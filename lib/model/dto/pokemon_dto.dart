import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_ability_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_base_stat_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_move_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_sprites_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_type_dto.dart';

part 'pokemon_dto.freezed.dart';

@freezed
sealed class PokemonDto with _$PokemonDto {
  const factory PokemonDto({
    @Default(0) int id,
    @Default('') String name,
    @Default(PokemonSpritesDto()) PokemonSpritesDto sprites,
    @Default(<PokemonTypeDto>[]) List<PokemonTypeDto> typeList,
    @Default(<PokemonAbilityDto>[]) List<PokemonAbilityDto> abilityList,
    @Default(0) int heightInDecimeters,
    @Default(0) int weightInDecimeters,
    @Default(0) int baseExperience,
    @Default(<PokemonBaseStatDto>[]) List<PokemonBaseStatDto> baseStatList,
    @Default(PokemonInfoDto()) PokemonInfoDto speciesInfo,
    @Default(<PokemonMoveDto>[]) List<PokemonMoveDto> moveList,
  }) = _PokemonDto;
}
