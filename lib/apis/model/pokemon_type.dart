import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({
    @JsonKey(name: 'slot') int? slot,
    @JsonKey(name: 'type') PokemonInfo? typeInfo,
  }) = _PokemonType;

  factory PokemonType.fromJson(Json json) => _$PokemonTypeFromJson(json);
}
