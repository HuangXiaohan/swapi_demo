import 'package:json_annotation/json_annotation.dart';

part 'starship.g.dart';

@JsonSerializable()
class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String crew;
  final String consumables;
  final String starship_class;

  Starship(
      {required this.name,
      required this.model,
      required this.manufacturer,
      required this.crew,
      required this.consumables,
      required this.starship_class});

  factory Starship.fromJson(Map<String, dynamic> json) => _$StarshipFromJson(json);

  Map<String, dynamic> toJson() => _$StarshipToJson(this);
}
