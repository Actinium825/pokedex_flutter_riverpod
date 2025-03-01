import 'package:pokedex_flutter_riverpod/apis/model/pokemon_ability.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_ability_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';

extension PokemonAbilityExt on PokemonAbility {
  PokemonAbilityDto toDto() => PokemonAbilityDto(abilityInfo: abilityInfo?.toDto() ?? const PokemonInfoDto());
}

extension PokemonAbilityDtoExt on PokemonAbilityDto {
  String get name => abilityInfo.name;
}
