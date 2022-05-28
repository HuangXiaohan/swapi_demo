import 'package:dio/dio.dart';
import 'package:swapi_demo/models/specie.dart';

class SpecieService {
  final dio = Dio();

  Future<List<Specie>> getSpecie() {
    const uri = 'https://swapi.dev/api/species';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Specie> specieList = list.map((value) => Specie.fromJson(value)).toList();
          return specieList;
        } else {
          throw ('Cannot get specie list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
