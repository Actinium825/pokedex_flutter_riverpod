import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/apis/model/pokemon_info.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'evolves_to.freezed.dart';
part 'evolves_to.g.dart';

@freezed
sealed class EvolvesTo with _$EvolvesTo {
  const factory EvolvesTo({
    @JsonKey(name: 'species') PokemonInfo? speciesInfo,
    @JsonKey(name: 'evolves_to') List<EvolvesTo>? evolutions,
  }) = _EvolvesTo;

  factory EvolvesTo.fromJson(Json json) => _$EvolvesToFromJson(json);
}
