import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/apis/model/evolution_chain_info.dart';
import 'package:pokedex_flutter_riverpod/apis/model/flavor_text_entry.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'pokemon_species.freezed.dart';
part 'pokemon_species.g.dart';

@freezed
sealed class PokemonSpecies with _$PokemonSpecies {
  const factory PokemonSpecies({
    @JsonKey(name: 'evolution_chain') EvolutionChainInfo? evolutionChainInfo,
    @JsonKey(name: 'flavor_text_entries') List<FlavorTextEntry>? flavorTextEntries,
  }) = _PokemonSpecies;

  factory PokemonSpecies.fromJson(Json json) => _$PokemonSpeciesFromJson(json);
}
