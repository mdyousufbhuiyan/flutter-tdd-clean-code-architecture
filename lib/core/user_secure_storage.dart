import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserSecureStorage {
  Future setSecureData(String key, String value);

  Future<String?> getSecureData(String key);

  Future deleteSecureData(String key);

  Future deleteAll();
}

class UserSecureStorageImpl implements UserSecureStorage {
  //final _storage =
  final FlutterSecureStorage _storage;

  UserSecureStorageImpl(this._storage);

  @override
  Future setSecureData(String key, String value) async => await _storage.write(
        key: key,
        value: value,
      );

  @override
  Future<String?> getSecureData(String key) async => await _storage.read(
        key: key,
      );

  @override
  Future deleteSecureData(String key) async => _storage.delete(key: key);

  @override
  Future deleteAll() async {
  return  _storage.deleteAll();
  }
}

AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: false,
// keyCipherAlgorithm:
//     KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
// storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding
// sharedPreferencesName: 'Test2',
// preferencesKeyPrefix: 'Test'
    );
