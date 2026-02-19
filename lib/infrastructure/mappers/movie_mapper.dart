import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

import '../models/moviedb/movie_details.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') 
    ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
    : 'https://cdn.displate.com/artwork/270x380/2025-03-20/bc08776e-1867-4de1-857b-28966d6fb9bf.jpg',
    
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
    ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
    : /*'no-poster' 'https://cdn.displate.com/artwork/270x380/2025-03-20/bc08776e-1867-4de1-857b-28966d6fb9bf.jpg'*/ 'https://t3.ftcdn.net/jpg/06/71/33/46/360_F_671334604_ZBV26w9fERX8FCLUyDrCrLrZG6bq7h0Q.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails moviedb)=> Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') 
    ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
    : 'https://cdn.displate.com/artwork/270x380/2025-03-20/bc08776e-1867-4de1-857b-28966d6fb9bf.jpg',
    
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
    ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
    : 'https://cdn.displate.com/artwork/270x380/2025-03-20/bc08776e-1867-4de1-857b-28966d6fb9bf.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
);
}