import 'package:get_it/get_it.dart';
import 'package:we_ready_app/presentation/core/service/theme_service.dart';
import 'data/data_source/shared/shared_preferences_data_source.dart';

final sl = GetIt.I;

Future<void> init() async {

  /// SERVICES
  sl.registerLazySingleton(
    () => ThemeService(
      sharedPreferenceDataSource: sl(),
    ),
  );

  /// MAIN INJECTOR & EXTERNAL LIBRARY
  sl.registerLazySingleton(() => SharedPreferenceDataSource());

}