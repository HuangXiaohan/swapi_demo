import 'package:dio/dio.dart';
import 'package:swapi_demo/models/film.dart';
import 'package:swapi_demo/models/resource.dart';

class FilmService {
  final dio = Dio();

  Future<Resource> getFilm({String? url}) {
    var uri = url ?? 'https://swapi.dev/api/films';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Film> filmList = list.map((value) => Film.fromJson(value)).toList();
          final next = response.data['next'];
          final previous = response.data['previous'];
          return Resource(list: filmList, next: next, previous: previous);
        } else {
          throw ('Cannot get film list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
