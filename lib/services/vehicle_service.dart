import 'package:dio/dio.dart';
import 'package:swapi_demo/models/resource.dart';
import 'package:swapi_demo/models/vehicle.dart';

class VehicleService {
  final dio = Dio();

  Future<Resource> getVehicle({String? url}) {
    var uri = url ?? 'https://swapi.dev/api/vehicles';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Vehicle> vehicleList = list.map((value) => Vehicle.fromJson(value)).toList();
          final next = response.data['next'];
          final previous = response.data['previous'];
          return Resource(list: vehicleList, next: next, previous: previous);
        } else {
          throw ('Cannot get vehicle list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
