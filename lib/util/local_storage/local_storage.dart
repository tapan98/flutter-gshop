import 'package:get_storage/get_storage.dart';

import '../logger/logger.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() { // Singleton class
    return _instance;
  }

  LocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    Log.debug("Saving $key...");
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    Log.debug("Reading $key...");
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    Log.debug("Removing $key...");
    await _storage.remove(key);
  }

  /// Clear all data from storage
  Future<void> clearAll() async {
    Log.debug("Clearing all data...");
    await _storage.erase();
  }
}