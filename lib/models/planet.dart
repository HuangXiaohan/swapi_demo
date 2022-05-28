import 'package:json_annotation/json_annotation.dart';

part 'planet.g.dart';

@JsonSerializable()
class Planet {
  final String name;
  final String rotation_period;
  final String orbital_period;
  final String diameter;
  final String gravity;
  final String terrain;
  final String surface_water;
  final String population;

  Planet(
      {required this.name,
      required this.rotation_period,
      required this.orbital_period,
      required this.diameter,
      required this.gravity,
      required this.terrain,
      required this.surface_water,
      required this.population});

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);
}
