
import 'package:get_it/get_it.dart';
import 'package:rate_my_jerky/scoped_model/home_model.dart';
import 'package:rate_my_jerky/scoped_model/list_view_model.dart';
import 'package:rate_my_jerky/scoped_model/rate_model.dart';
import 'package:rate_my_jerky/services/navigation_service.dart';
import 'package:rate_my_jerky/services/request_service.dart';
import 'package:rate_my_jerky/services/theme_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => RequestService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ThemeService());

  // Register models
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => RateModel());
  locator.registerFactory(() => RatingListViewModel());
}
