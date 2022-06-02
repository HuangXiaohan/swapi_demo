import 'package:dio/dio.dart';
import 'package:swapi_demo/models/people.dart';
import 'package:swapi_demo/models/resource.dart';

class PeopleService {
  final dio = Dio();

  Future<Resource> getPeople({String? url}) {
    var uri = url ?? 'https://swapi.dev/api/people';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<People> peopleList = list.map((value) => People.fromJson(value)).toList();
          final next = response.data['next'];
          final previous = response.data['previous'];
          return Resource(list: peopleList, next: next, previous: previous);
        } else {
          throw ('Cannot get people list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
