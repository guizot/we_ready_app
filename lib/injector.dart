import 'package:get_it/get_it.dart';
import 'package:we_ready_app/data/repositories/hive_repo_impl.dart';
import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import 'package:we_ready_app/presentation/core/service/theme_service.dart';
import 'package:we_ready_app/presentation/pages/event/cubit/event_cubit.dart';
import 'package:we_ready_app/presentation/pages/invitation/cubit/invitation_cubit.dart';
import 'package:we_ready_app/presentation/pages/payment/cubit/peyment_cubit.dart';
import 'package:we_ready_app/presentation/pages/rundown/cubit/rundown_cubit.dart';
import 'package:we_ready_app/presentation/pages/vendor/cubit/vendor_cubit.dart';
import 'data/datasource/local/hive_data_source.dart';
import 'data/datasource/shared/shared_preferences_data_source.dart';
import 'domain/usecases/event_usecases.dart';
import 'domain/usecases/invitation_usecases.dart';
import 'domain/usecases/payment_usecases.dart';
import 'domain/usecases/rundown_usecases.dart';
import 'domain/usecases/vendor_usecases.dart';

final sl = GetIt.I;

Future<void> init() async {

  /// SERVICES
  sl.registerLazySingleton(
    () => ThemeService(
      sharedPreferenceDataSource: sl(),
    ),
  );

  /// PRESENTATION LAYER
  sl.registerFactory(
    () => EventCubit(
      eventUseCases: sl(),
    ),
  );
  sl.registerFactory(
    () => VendorCubit(
      vendorUseCases: sl(),
    ),
  );
  sl.registerFactory(
    () => InvitationCubit(
      invitationUseCases: sl(),
    ),
  );
  sl.registerFactory(
    () => RundownCubit(
      rundownUseCases: sl(),
    ),
  );
  sl.registerFactory(
    () => PaymentCubit(
      paymentUseCases: sl(),
    ),
  );

  /// DOMAIN LAYER
  sl.registerLazySingleton(
    () => EventUseCases(
      hiveRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VendorUseCases(
      hiveRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => InvitationUseCases(
      hiveRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => RundownUseCases(
      hiveRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => PaymentUseCases(
      hiveRepo: sl(),
    ),
  );

  /// DATA LAYER
  sl.registerLazySingleton<HiveRepo>(
    () => HiveRepoImpl(
      hiveDataSource: sl()
    ),
  );

  /// MAIN INJECTOR & EXTERNAL LIBRARY
  sl.registerLazySingleton(() => HiveDataSource());
  sl.registerLazySingleton(() => SharedPreferenceDataSource());

}