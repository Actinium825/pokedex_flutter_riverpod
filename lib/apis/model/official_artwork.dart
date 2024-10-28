import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter_riverpod/utils/typedef.dart';

part 'official_artwork.freezed.dart';
part 'official_artwork.g.dart';

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    @JsonKey(name: 'front_default') String? imageUrl,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Json json) => _$OfficialArtworkFromJson(json);
}
