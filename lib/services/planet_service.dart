import 'package:dio/dio.dart';
import 'package:swapi_demo/models/planet.dart';
import 'package:swapi_demo/models/resource.dart';

class PlanetService {
  final dio = Dio();

  Future<Resource> getPlanet({String? url}) {
    var uri = url ?? 'https://swapi.dev/api/planets';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Planet> planetList = list.map((value) => Planet.fromJson(value)).toList();
          final next = response.data['next'];
          final previous = response.data['previous'];
          return Resource(list: planetList, next: next, previous: previous);
        } else {
          throw ('Cannot get planet list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
