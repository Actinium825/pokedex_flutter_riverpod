import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'pokemon_move.freezed.dart';
part 'pokemon_move.g.dart';

@freezed
sealed class PokemonMove with _$PokemonMove {
  const factory PokemonMove({
    @JsonKey(name: 'move') PokemonInfo? moveInfo,
  }) = _PokemonMove;

  factory PokemonMove.fromJson(Json json) => _$PokemonMoveFromJson(json);
}
