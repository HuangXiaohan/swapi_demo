import 'package:dio/dio.dart';
import 'package:swapi_demo/models/category.dart';

class RootService {
  final dio = Dio();

  Future<List<Category>> getCategories() {
    const uri = 'https://swapi.dev/api/';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final list = response.data;
          final categoryList = <Category>[];
          for (var key in list.keys) {
            categoryList.add(Category(key: key, value: list[key]));
          }
          return categoryList;
        } else {
          throw ('Cannot get categories');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
