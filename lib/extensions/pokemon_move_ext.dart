import 'package:pokedex_flutter_riverpod/apis/model/pokemon_move.dart';
import 'package:pokedex_flutter_riverpod/extensions/pokemon_info_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_info_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_move_dto.dart';

extension PokemonMoveExt on PokemonMove {
  PokemonMoveDto toDto() => PokemonMoveDto(moveInfo: moveInfo?.toDto() ?? const PokemonInfoDto());
}
