import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  final String title;
  final String episode_id;
  final String opening_crawl;
  final String director;
  final String producer;
  final String release_date;

  Film(
      {required this.title,
      required this.episode_id,
      required this.opening_crawl,
      required this.director,
      required this.producer,
      required this.release_date});

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
