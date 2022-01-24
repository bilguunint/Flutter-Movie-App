import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre(this.id, this.name);

  Genre.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"] ?? "";

  @override
  List<Object> get props => [id, name];

  static const empty = Genre(0, "");
}
