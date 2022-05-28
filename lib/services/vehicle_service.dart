import 'package:dio/dio.dart';
import 'package:swapi_demo/models/vehicle.dart';

class VehicleService {
  final dio = Dio();

  Future<List<Vehicle>> getVehicle() {
    const uri = 'https://swapi.dev/api/vehicles';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> list = response.data['results'];
          final List<Vehicle> vehicleList = list.map((value) => Vehicle.fromJson(value)).toList();
          return vehicleList;
        } else {
          throw ('Cannot get vehicle list');
        }
      });
    } catch (e) {
      throw ('Error occurred: $e');
    }
  }
}
