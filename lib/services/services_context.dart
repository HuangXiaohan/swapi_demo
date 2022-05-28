import 'package:get_it/get_it.dart';
import 'package:swapi_demo/services/film_service.dart';
import 'package:swapi_demo/services/people_service.dart';
import 'package:swapi_demo/services/planet_service.dart';
import 'package:swapi_demo/services/root_service.dart';
import 'package:swapi_demo/services/specie_service.dart';
import 'package:swapi_demo/services/starship_service.dart';
import 'package:swapi_demo/services/vehicle_service.dart';

final getIt = GetIt.instance;

class ServicesContext {
  static void initContext() {
    getIt.registerLazySingleton(() => RootService());
    getIt.registerLazySingleton(() => PeopleService());
    getIt.registerLazySingleton(() => PlanetService());
    getIt.registerLazySingleton(() => FilmService());
    getIt.registerLazySingleton(() => VehicleService());
    getIt.registerLazySingleton(() => StarshipService());
    getIt.registerLazySingleton(() => SpecieService());
  }
}
