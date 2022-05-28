import 'package:dio/dio.dart';
import 'package:swapi_demo/models/film.dart';

class FilmService {
  final dio = Dio();

  Future<List<Film>> getFilm() {
    const uri = 'https://swapi.dev/api/films';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Film> filmList = list.map((value) => Film.fromJson(value)).toList();
          return filmList;
        } else {
          throw ('Cannot get film list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
