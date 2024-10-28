import 'package:freezed_annotation/freezed_annotation.dart';

part 'evolution_chain_info_dto.freezed.dart';

@freezed
class EvolutionChainInfoDto with _$EvolutionChainInfoDto {
  const factory EvolutionChainInfoDto({
    @Default('') String url,
  }) = _EvolutionChainInfoDto;
}
