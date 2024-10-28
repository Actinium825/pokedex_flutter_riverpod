import 'package:pokedex_flutter_riverpod/apis/model/pokemon_evolution_chain.dart';
import 'package:pokedex_flutter_riverpod/extensions/evolves_to_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/evolves_to_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_evolution_chain_dto.dart';

extension PokemonEvolutionChainExt on PokemonEvolutionChain {
  PokemonEvolutionChainDto toDto() => PokemonEvolutionChainDto(chain: chain?.toDto() ?? const EvolvesToDto());
}

extension PokemonEvolutionChainDtoExt on PokemonEvolutionChainDto {
  List<EvolvesToDto> get stage2Evolutions => chain.evolutions;

  List<EvolvesToDto> get stage3Evolutions {
    final stage3Evolutions = <EvolvesToDto>[];

    for (final stage2Evolution in stage2Evolutions) {
      for (final stage3Evolution in stage2Evolution.evolutions) {
        stage3Evolutions.add(stage3Evolution);
      }
    }

    return stage3Evolutions;
  }
}
