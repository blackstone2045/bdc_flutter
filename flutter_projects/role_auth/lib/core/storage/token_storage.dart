import 'package:get_storage/get_storage.dart';

class TokenStorage {
  static const String _tokenKey = 'access_token';
  static const String _email = 'email';
  static const String _password = 'password';
  static const String _refreshToken = 'refreshToken';
  final GetStorage _storage;

  TokenStorage(this._storage);
  // save to storage
  Future<void> saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  Future<void> saveEmail(String email) async {
    await _storage.write(_email, email);
  }

  Future<void> savePassword(String password) async {
    await _storage.write(_password, password);
  }

  // get from storage
  String? getToken() {
    return _storage.read<String>(_tokenKey);
  }

  String? getEmail() {
    return _storage.read<String>(_email);
  }

  String? getPassword() {
    return _storage.read<String>(_password);
  }

  // clear from storage
  Future<void> clearToken() async {
    await _storage.remove(_tokenKey);
  }

  Future<void> clearEmail() async {
    await _storage.remove(_email);
  }

  Future<void> clearPassword() async {
    await _storage.remove(_password);
  }

  // check if token exists
  bool get hasToken {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }

  bool get hasEmail {
    final email = getEmail();
    return email != null && email.isNotEmpty;
  }

  bool get hasPassword {
    final password = getPassword();
    return password != null && password.isNotEmpty;
  }
}
