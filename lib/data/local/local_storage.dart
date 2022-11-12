import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  T? get<T>(String key);

  String? getString(String key);

  int? getInt(String key);

  bool? getBool(String key);

  double? getDouble(String key);

  Future<bool> setString(String key, String value);

  Future<bool> setInt(String key, int value);

  Future<bool> setBool(String key, bool value);

  Future<bool> setDouble(String key, double value);

  Future<bool> remove(String key);
}

class LocalStorageImpl extends LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorageImpl(this.sharedPreferences);

  @override
  bool? getBool(String key) => sharedPreferences.getBool(key);

  @override
  int? getInt(String key) => sharedPreferences.getInt(key);

  @override
  String? getString(String key) => sharedPreferences.getString(key);

  @override
  T? get<T>(String key) => sharedPreferences.get(key) as T?;

  @override
  double? getDouble(String key) => sharedPreferences.getDouble(key);

  @override
  Future<bool> setBool(String key, bool value) => sharedPreferences.setBool(key, value);

  @override
  Future<bool> setDouble(String key, double value) => sharedPreferences.setDouble(key, value);

  @override
  Future<bool> setInt(String key, int value) => sharedPreferences.setInt(key, value);

  @override
  Future<bool> setString(String key, String value) => sharedPreferences.setString(key, value);

  @override
  Future<bool> remove(String key) {
    return sharedPreferences.remove(key);
  }
}
