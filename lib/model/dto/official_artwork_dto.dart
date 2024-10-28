import 'package:freezed_annotation/freezed_annotation.dart';

part 'official_artwork_dto.freezed.dart';

@freezed
class OfficialArtworkDto with _$OfficialArtworkDto {
  const factory OfficialArtworkDto({
    @Default('') String imageUrl,
  }) = _OfficialArtworkDto;
}
