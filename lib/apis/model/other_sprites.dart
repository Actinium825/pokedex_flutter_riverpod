import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/apis/model/official_artwork.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'other_sprites.freezed.dart';
part 'other_sprites.g.dart';

@freezed
sealed class OtherSprites with _$OtherSprites {
  const factory OtherSprites({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  }) = _OtherSprites;

  factory OtherSprites.fromJson(Json json) => _$OtherSpritesFromJson(json);
}
