import 'package:dio/dio.dart';
import 'package:swapi_demo/models/resource.dart';
import 'package:swapi_demo/models/starship.dart';

class StarshipService {
  final dio = Dio();

  Future<Resource> getStarship({String? url}) {
    var uri = url ?? 'https://swapi.dev/api/starships';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Starship> starshipList = list.map((value) => Starship.fromJson(value)).toList();
          final next = response.data['next'];
          final previous = response.data['previous'];
          return Resource(list: starshipList, next: next, previous: previous);
        } else {
          throw ('Cannot get starship list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
