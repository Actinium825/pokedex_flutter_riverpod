import 'package:pokedex_flutter_riverpod/apis/model/other_sprites.dart';
import 'package:pokedex_flutter_riverpod/extensions/official_artwork_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/official_artwork_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/other_sprites_dto.dart';

extension OtherSpritesExt on OtherSprites {
  OtherSpritesDto toDto() => OtherSpritesDto(officialArtwork: officialArtwork?.toDto() ?? const OfficialArtworkDto());
}
