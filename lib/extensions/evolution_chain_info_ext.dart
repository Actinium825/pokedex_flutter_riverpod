import 'package:pokedex_flutter_riverpod/apis/model/evolution_chain_info.dart';
import 'package:pokedex_flutter_riverpod/model/dto/evolution_chain_info_dto.dart';

extension EvolutionChainInfoExt on EvolutionChainInfo {
  EvolutionChainInfoDto toDto() => EvolutionChainInfoDto(url: url ?? '');
}
