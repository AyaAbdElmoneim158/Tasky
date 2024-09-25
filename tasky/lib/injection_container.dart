import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'core/api/dio_consumer.dart';
import 'features/login/data/repos/login_repo_impl.dart';
import 'features/login/presentation/view_model/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///* Cubit -------------------------------------------------------------------
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
  sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(api: sl()));
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl<Dio>()));

  ///* External ----------------------------------------------------------------
  sl.registerLazySingleton<Dio>(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => flutterSecureStorage);
}
