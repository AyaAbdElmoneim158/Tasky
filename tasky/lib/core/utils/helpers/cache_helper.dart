import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../injection_container.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences = sl<SharedPreferences>();

  static dynamic getData(String key) {
    debugPrint('CacheHelper: getData with key: $key');
    return sharedPreferences?.get(key);
  }

  static Future<bool> getBool(String key) async {
    debugPrint('CacheHelper: getBool with key: $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    debugPrint('CacheHelper: getDouble with key: $key');
    return sharedPreferences?.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    debugPrint('CacheHelper: getInt with key: $key');
    return sharedPreferences?.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    debugPrint('CacheHelper: getString with key: $key');
    return sharedPreferences?.getString(key) ?? '';
  }

  static Future<bool?> saveData(String key, dynamic value) async {
    debugPrint('CacheHelper: saveData with key: $key and value: $value');
    switch (value.runtimeType) {
      case const (String):
        return await sharedPreferences?.setString(key, value);
      case const (int):
        return await sharedPreferences?.setInt(key, value);
      case const (bool):
        return await sharedPreferences?.setBool(key, value);
      case const (double):
        return await sharedPreferences?.setDouble(key, value);
      default:
        return null;
    }
  }

  static Future<bool?> removeData({required String key}) async {
    return await sharedPreferences?.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('CacheHelper: All data has been cleared');
    await sharedPreferences?.clear();
  }
}
