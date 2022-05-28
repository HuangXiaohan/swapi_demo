// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
      title: json['title'] as String,
      episode_id: json['episode_id'] as int,
      opening_crawl: json['opening_crawl'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      release_date: json['release_date'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'title': instance.title,
      'episode_id': instance.episode_id,
      'opening_crawl': instance.opening_crawl,
      'director': instance.director,
      'producer': instance.producer,
      'release_date': instance.release_date,
      'url': instance.url,
    };
