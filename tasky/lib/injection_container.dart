import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/api/dio_consumer.dart';
import 'features/profile/data/repos/profile_repo.dart';
import 'features/profile/data/repos/profile_repo_impl.dart';
import 'features/profile/presentation/view_model/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// External ----------------------------------------------------------------
  sl.registerLazySingleton<Dio>(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => flutterSecureStorage);

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl<Dio>()));

  /// Repository -------------------------------------------------------------------
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(api: sl<DioConsumer>()));
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(api: sl<DioConsumer>()));

  /// Cubit -------------------------------------------------------------------
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl<ProfileRepo>()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl<ProfileRepo>()));
}
