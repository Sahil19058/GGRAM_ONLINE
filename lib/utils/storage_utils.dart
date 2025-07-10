import 'package:get_storage/get_storage.dart';

/// Singleton instance of GetStorage
final GetStorage storage = GetStorage();

/// Write data to storage
Future<void> setStorage(String key, dynamic value) async {
  await storage.write(key, value);
}

/// Read data from storage
 getStorage(String key) {
  return storage.read(key);
}

/// Check if key exists
bool hasStorage(String key) {
  return storage.hasData(key);
}

/// Remove a specific key
Future<void> removeStorage(String key) async {
  await storage.remove(key);
}

/// Clear all storage
Future<void> clearStorage() async {
  await storage.erase();
}
