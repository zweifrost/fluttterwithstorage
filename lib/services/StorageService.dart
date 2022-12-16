import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertest/models/StorageItem.dart';
import 'package:fluttertest/models/Storageitem.dart';

class StorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> savedata(StorageItem Item) async {
    await _storage.write(
        key: Item.key, value: Item.value, aOptions: _androidOptions());
  }

  AndroidOptions _androidOptions() =>
      AndroidOptions(encryptedSharedPreferences: true);

  Future<String?> readData(String key) async {
    var data = await _storage.read(key: key, aOptions: _androidOptions());
    return data;
  }

  Future<List<StorageItem>> readAllData() async {
    var data = await _storage.readAll(aOptions: _androidOptions());

    List<StorageItem> items =
        data.entries.map((e) => StorageItem(e.key, e.value)).toList();

    return items;
  }

  Future<void> deleteAllData() async {
    await _storage.deleteAll(aOptions: _androidOptions());
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(key: key, aOptions: _androidOptions());
  }
}
