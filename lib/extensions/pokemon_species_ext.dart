import 'package:pokedex_flutter_riverpod/apis/model/pokemon_species.dart';
import 'package:pokedex_flutter_riverpod/extensions/evolution_chain_info_ext.dart';
import 'package:pokedex_flutter_riverpod/extensions/flavor_text_entry_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/evolution_chain_info_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_species_dto.dart';
import 'package:pokedex_flutter_riverpod/utils/strings.dart';

extension PokemonSpeciesExt on PokemonSpecies {
  PokemonSpeciesDto toDto() => PokemonSpeciesDto(
        evolutionChainInfo: evolutionChainInfo?.toDto() ?? const EvolutionChainInfoDto(),
        flavorTextEntries: [...?flavorTextEntries?.map((flavorTextEntry) => flavorTextEntry.toDto())],
      );
}

extension PokemonSpeciesDtoExt on PokemonSpeciesDto {
  String get flavorTextEnglish => flavorTextEntries
      .firstWhere((flavorText) => flavorText.languageInfo.name == english)
      .flavorText
      .replaceAll('\n', ' ')
      .replaceAll('\u000c', ' ');
}
