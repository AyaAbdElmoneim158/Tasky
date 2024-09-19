import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///* Cubit -------------------------------------------------------------------

  ///* External ----------------------------------------------------------------
  sl.registerLazySingleton(() => Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => flutterSecureStorage);
}
