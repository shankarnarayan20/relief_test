import 'package:get_it/get_it.dart';
import 'package:relief_test/services/authentication_service.dart';
import 'package:relief_test/services/firestore_service.dart';
import 'package:relief_test/services/location_service.dart';
import 'package:relief_test/services/navigation_service.dart';
import 'package:relief_test/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => LocationService());
}
