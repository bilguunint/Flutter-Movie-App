import 'package:equatable/equatable.dart';

import 'company.dart';
import 'genre.dart';

class MovieDetail extends Equatable {
  final int id;
  final num popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final num rating;
  final String releaseDate;
  final List<Genre> genres;
  final List<Company> companies;
  final int budget;
  final int revenue;
  final String status;
  final int runtime;

  const MovieDetail(
      this.id,
      this.popularity,
      this.title,
      this.backPoster,
      this.poster,
      this.overview,
      this.rating,
      this.releaseDate,
      this.genres,
      this.companies,
      this.budget,
      this.revenue,
      this.status,
      this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"] ?? 0,
        title = json["title"] ?? "",
        backPoster = json["backdrop_path"] ?? "",
        poster = json["poster_path"] ?? "",
        overview = json["overview"] ?? "",
        rating = json["vote_average"] ?? 0.0,
        releaseDate = json["release_date"] ?? "",
        genres =
            (json["genres"] as List).map((i) => Genre.fromJson(i)).toList(),
        companies = (json["production_companies"] as List)
            .map((i) => Company.fromJson(i))
            .toList(),
        budget = json["budget"] ?? 0,
        revenue = json["revenue"] ?? 0,
        status = json["status"] ?? "",
        runtime = json["runtime"] ?? 0;

  @override
  List<Object> get props =>
      [id, popularity, title, backPoster, poster, overview, rating];

  static const empty =
      MovieDetail(0, 0, "", "", "", "", 0, "", [], [], 0, 0, "", 0);
}
