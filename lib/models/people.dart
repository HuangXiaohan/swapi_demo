import 'package:json_annotation/json_annotation.dart';

part 'people.g.dart';

@JsonSerializable()
class People {
  final String name;
  final String height;
  final String mass;
  final String hair_color;
  final String skin_color;
  final String eye_color;
  final String birth_year;
  final String gender;
  final String url;

  People(
      {required this.name,
      required this.height,
      required this.mass,
      required this.hair_color,
      required this.skin_color,
      required this.eye_color,
      required this.birth_year,
      required this.gender,
      required this.url});

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}
