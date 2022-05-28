// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      name: json['name'] as String,
      height: json['height'] as String,
      mass: json['mass'] as String,
      hair_color: json['hair_color'] as String,
      skin_color: json['skin_color'] as String,
      eye_color: json['eye_color'] as String,
      birth_year: json['birth_year'] as String,
      gender: json['gender'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'mass': instance.mass,
      'hair_color': instance.hair_color,
      'skin_color': instance.skin_color,
      'eye_color': instance.eye_color,
      'birth_year': instance.birth_year,
      'gender': instance.gender,
      'url': instance.url,
    };
