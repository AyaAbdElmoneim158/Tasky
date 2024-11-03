import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/data/repos/auth_repo.dart';
import 'features/auth/presentation/view_model/auth_cubit.dart';
import 'features/profile/data/repos/profile_repo.dart';
import 'features/profile/data/repos/profile_repo_impl.dart';
import 'features/profile/presentation/view_model/profile_cubit.dart';
import 'features/todos/data/repos/todo_repo.dart';
import 'features/todos/data/repos/todo_repo_impl.dart';
import 'features/todos/presentation/view_model/todo_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///* External ----------------------------------------------------------------
  sl.registerLazySingleton<Dio>(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => flutterSecureStorage);

  ///* Repository -------------------------------------------------------------------
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(api: sl<DioConsumer>()));
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(api: sl<DioConsumer>()));

  sl.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(api: sl<DioConsumer>()));

  ///* Cubit -------------------------------------------------------------------
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepo>()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl<ProfileRepo>()));
  sl.registerFactory<TodoCubit>(() => TodoCubit(sl<TodoRepo>()));

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl<Dio>()));
}
