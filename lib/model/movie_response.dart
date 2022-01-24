import 'movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final int totalResults;
  final bool hasError;
  final String error;

  MovieResponse(this.movies, this.totalResults, this.hasError, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => Movie.fromJson(i))
            .toList(),
        totalResults = json["total_results"],
        hasError = false,
        error = "";

  MovieResponse.withError(String errorValue)
      : movies = [],
        totalResults = 0,
        hasError = true,
        error = errorValue;
}
