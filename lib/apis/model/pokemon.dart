import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_ability.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_base_stat.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_move.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_sprites.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_type.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'sprites') PokemonSprites? sprites,
    @JsonKey(name: 'types') List<PokemonType>? typeList,
    @JsonKey(name: 'abilities') List<PokemonAbility>? abilityList,
    @JsonKey(name: 'height') int? heightInDecimeters,
    @JsonKey(name: 'weight') int? weightInDecimeters,
    @JsonKey(name: 'base_experience') int? baseExperience,
    @JsonKey(name: 'stats') List<PokemonBaseStat>? baseStatList,
    @JsonKey(name: 'species') PokemonInfo? speciesInfo,
    @JsonKey(name: 'moves') List<PokemonMove>? moveList,
  }) = _Pokemon;

  factory Pokemon.fromJson(Json json) => _$PokemonFromJson(json);
}
