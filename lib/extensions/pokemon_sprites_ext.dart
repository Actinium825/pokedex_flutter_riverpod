import 'package:pokedex_flutter_riverpod/apis/model/pokemon_sprites.dart';
import 'package:pokedex_flutter_riverpod/extensions/other_sprites_ext.dart';
import 'package:pokedex_flutter_riverpod/model/dto/other_sprites_dto.dart';
import 'package:pokedex_flutter_riverpod/model/dto/pokemon_sprites_dto.dart';

extension PokemonSpritesExt on PokemonSprites {
  PokemonSpritesDto toDto() => PokemonSpritesDto(
        frontDefaultImageUrl: frontDefaultImageUrl ?? '',
        otherSprites: otherSprites?.toDto() ?? const OtherSpritesDto(),
      );
}
