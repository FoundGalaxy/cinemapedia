

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => 
      Actor(
        id: cast.id, 
        name: cast.name, 
        profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://static.vecteezy.com/system/resources/previews/013/360/247/non_2x/default-avatar-photo-icon-social-media-profile-sign-symbol-vector.jpg', 
        character: cast.character != null
        ?'${cast.character}'
        : '', 
        );
}