import 'package:json_annotation/json_annotation.dart';

part 'specie.g.dart';

@JsonSerializable()
class Specie {
  final String name;
  final String classification;
  final String designation;
  final String skin_colors;
  final String hair_colors;
  final String eye_colors;
  final String language;

  Specie(
      {required this.name,
      required this.classification,
      required this.designation,
      required this.skin_colors,
      required this.hair_colors,
      required this.eye_colors,
      required this.language});

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);

  Map<String, dynamic> toJson() => _$SpecieToJson(this);
}
