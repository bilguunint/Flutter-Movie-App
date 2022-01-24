import 'package:equatable/equatable.dart';
import 'company.dart';
import 'genre.dart';

class MovieDetail extends Equatable {
  final int id;
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final List<Company> companies;
  final String releaseDate;
  final int runtime;

  const MovieDetail(this.id,
         this.adult,
         this.budget,
         this.genres,
         this.companies,
         this.releaseDate,
         this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"] ?? false,
        budget = json["budget"] ?? 0,
        genres = json["genres"] == null ? [] : (json["genres"] as List).map((i) => Genre.fromJson(i)).toList(),
        companies = json["production_companies"] == null ? [] : (json["production_companies"] as List).map((i) => Company.fromJson(i)).toList(),
        releaseDate = json["release_date"] ?? "",
        runtime = json["runtime"] ?? 0;

  @override
  List<Object> get props => [id, adult, budget, genres, companies, releaseDate, runtime];

  static const empty = MovieDetail(0, false, 0, [], [], "", 0);
}

