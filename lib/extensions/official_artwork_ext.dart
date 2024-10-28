import 'package:pokedex_flutter_riverpod/apis/model/official_artwork.dart';
import 'package:pokedex_flutter_riverpod/model/dto/official_artwork_dto.dart';

extension OfficialArtworkExt on OfficialArtwork {
  OfficialArtworkDto toDto() => OfficialArtworkDto(imageUrl: imageUrl ?? '');
}
