import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISecureStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class SecureStorageService implements ISecureStorage {
  final FlutterSecureStorage _secureStorage;

  static const tokenKey = 'auth_token';

  SecureStorageService()
    : _secureStorage = const FlutterSecureStorage(); 
  

  
  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: tokenKey, value: token);
  }

  @override
  Future<String?> getToken() {
    return _secureStorage.read(key: tokenKey);
  }

  @override
  Future<void> deleteToken() {
    return _secureStorage.delete(key: tokenKey);
  }
}