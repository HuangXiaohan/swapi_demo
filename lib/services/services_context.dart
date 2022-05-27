import 'package:get_it/get_it.dart';
import 'package:swapi_demo/services/root_service.dart';

final getIt = GetIt.instance;

class ServicesContext {
  static void initContext() {
    getIt.registerLazySingleton(() => RootService());
  }
}
