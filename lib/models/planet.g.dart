// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) => Planet(
      name: json['name'] as String,
      rotation_period: json['rotation_period'] as String,
      orbital_period: json['orbital_period'] as String,
      diameter: json['diameter'] as String,
      gravity: json['gravity'] as String,
      terrain: json['terrain'] as String,
      surface_water: json['surface_water'] as String,
      population: json['population'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PlanetToJson(Planet instance) => <String, dynamic>{
      'name': instance.name,
      'rotation_period': instance.rotation_period,
      'orbital_period': instance.orbital_period,
      'diameter': instance.diameter,
      'gravity': instance.gravity,
      'terrain': instance.terrain,
      'surface_water': instance.surface_water,
      'population': instance.population,
      'url': instance.url,
    };
