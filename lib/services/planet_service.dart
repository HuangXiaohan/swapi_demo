import 'package:dio/dio.dart';
import 'package:swapi_demo/models/planet.dart';

class PlanetService {
  final dio = Dio();

  Future<List<Planet>> getPlanet() {
    const uri = 'https://swapi.dev/api/planets';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Planet> planetList = list.map((value) => Planet.fromJson(value)).toList();
          return planetList;
        } else {
          throw ('Cannot get planet list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
