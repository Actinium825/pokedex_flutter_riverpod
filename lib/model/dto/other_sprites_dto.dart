import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/model/dto/official_artwork_dto.dart';

part 'other_sprites_dto.freezed.dart';

@freezed
sealed class OtherSpritesDto with _$OtherSpritesDto {
  const factory OtherSpritesDto({
    @Default(OfficialArtworkDto()) OfficialArtworkDto officialArtwork,
  }) = _OtherSpritesDto;
}
