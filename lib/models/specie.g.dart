// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map<String, dynamic> json) => Specie(
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      skin_colors: json['skin_colors'] as String,
      hair_colors: json['hair_colors'] as String,
      eye_colors: json['eye_colors'] as String,
      language: json['language'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SpecieToJson(Specie instance) => <String, dynamic>{
      'name': instance.name,
      'classification': instance.classification,
      'designation': instance.designation,
      'skin_colors': instance.skin_colors,
      'hair_colors': instance.hair_colors,
      'eye_colors': instance.eye_colors,
      'language': instance.language,
      'url': instance.url,
    };
