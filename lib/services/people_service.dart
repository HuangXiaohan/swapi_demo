import 'package:dio/dio.dart';
import 'package:swapi_demo/models/people.dart';

class PeopleService {
  final dio = Dio();

  Future<List<People>> getPeople() {
    const uri = 'https://swapi.dev/api/people';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<People> peopleList = list.map((value) => People.fromJson(value)).toList();
          return peopleList;
        } else {
          throw ('Cannot get people list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
