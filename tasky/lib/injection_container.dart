import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/data/repos/auth_repo.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/presentation/view_model/auth_cubit.dart';

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
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(api: sl<DioConsumer>()));

  /// Cubit -------------------------------------------------------------------
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepo>()));
}
