import 'package:get_storage/get_storage.dart';

class TokenStorage {
  static const String _tokenKey = 'access_token';

  final GetStorage _storage;

  TokenStorage(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  String? getToken() {
    return _storage.read<String>(_tokenKey);
  }

  Future<void> clearToken() async {
    await _storage.remove(_tokenKey);
  }

  bool get hasToken {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }
}
