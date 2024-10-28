import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/evolves_to_dto.dart';

part 'pokemon_evolution_chain_dto.freezed.dart';

@freezed
class PokemonEvolutionChainDto with _$PokemonEvolutionChainDto {
  const factory PokemonEvolutionChainDto({
    @Default(EvolvesToDto()) EvolvesToDto chain,
  }) = _PokemonEvolutionChainDto;
}
