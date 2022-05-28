// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Starship _$StarshipFromJson(Map<String, dynamic> json) => Starship(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      crew: json['crew'] as String,
      consumables: json['consumables'] as String,
      starship_class: json['starship_class'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StarshipToJson(Starship instance) => <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'crew': instance.crew,
      'consumables': instance.consumables,
      'starship_class': instance.starship_class,
      'url': instance.url,
    };
