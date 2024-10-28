import 'package:pokedex_flutter_riverpod/apis/model/pokemon_type.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_type_dto.dart';

extension PokemonTypeExt on PokemonType {
  PokemonTypeDto toDto() => PokemonTypeDto(
        slot: slot ?? 0,
        typeInfo: typeInfo?.toDto() ?? const PokemonInfoDto(),
      );
}

extension PokemonTypeDtoExt on PokemonTypeDto {
  String get name => typeInfo.name;
}
