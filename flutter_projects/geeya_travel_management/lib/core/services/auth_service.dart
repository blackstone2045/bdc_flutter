// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class AuthService {
  static const String _tokenKey = 'token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _idKey = 'id';
  static const String _roleKey = 'userRole';
  static const String _verifiedKey = 'isVerified';
  static const String _profileVerifiedKey = 'isProfileVerified';
  static const String _languageKey = 'language';

  // Keys used by the old SharedPreferences version (for migration only)
  static const String _legacyVerifiedKey = 'isVerified';
  static const String _legacyLanguageKey = 'en';

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  // In-memory cache so the getters stay synchronous
  static String? _token;
  static String? _refreshToken;
  static String? _id;
  static String? _userRole;
  static bool? _isVerified;
  static bool? _profileVerified;
  static String? _language;

  // Initialize storage (call this during app startup)
  static Future<void> init() async {
    try {
      _token = await _storage.read(key: _tokenKey);
      _refreshToken = await _storage.read(key: _refreshTokenKey);
      _id = await _storage.read(key: _idKey);
      _userRole = await _storage.read(key: _roleKey);
      _isVerified = _parseBool(await _storage.read(key: _verifiedKey));
      _profileVerified =
          _parseBool(await _storage.read(key: _profileVerifiedKey));
      _language = await _storage.read(key: _languageKey);
    } catch (e) {
      // Can happen on Android if the keystore key is lost (e.g. after a
      // backup restore). Start clean instead of crashing.
      log('Error reading secure storage, clearing it: $e');
      try {
        await _storage.deleteAll();
      } catch (_) {}
      _resetCache();
    }
  }

  static bool? _parseBool(String? value) =>
      value == null ? null : value == 'true';

  static void _resetCache() {
    _token = null;
    _refreshToken = null;
    _id = null;
    _userRole = null;
    _isVerified = null;
    _profileVerified = null;
    _language = null;
  }

  // Check if a token exists
  static bool hasToken() {
    return _token != null && _token!.isNotEmpty;
  }

  // Check if the verification status has been saved
  static bool isUserVerified() {
    return _isVerified != null;
  }

  // Check if the profile verification status has been saved
  static bool isProfileComplete() {
    return _profileVerified != null;
  }

  // Check if a role exists
  static bool hasRole() {
    return _userRole != null;
  }

  // Save the token
  static Future<void> saveToken({required String token}) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
      _token = token;
    } catch (e) {
      log('Error saving token: $e');
    }
  }

  static Future<void> saveRefreshToken({required String refreshToken}) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
      _refreshToken = refreshToken;
    } catch (e) {
      log('Error saving refresh token: $e');
    }
  }

  static Future<void> saveId({required String id}) async {
    try {
      await _storage.write(key: _idKey, value: id);
      _id = id;
    } catch (e) {
      log('Error saving id: $e');
    }
  }

  static Future<void> saveRole({required String role}) async {
    try {
      await _storage.write(key: _roleKey, value: role);
      _userRole = role;
    } catch (e) {
      log('Error saving role: $e');
    }
  }

  static Future<void> saveVerificationStatus({
    required bool verificationStatus,
  }) async {
    try {
      await _storage.write(
        key: _verifiedKey,
        value: verificationStatus.toString(),
      );
      _isVerified = verificationStatus;
    } catch (e) {
      log('Error saving verification status: $e');
    }
  }

  static Future<void> saveProfileVerificationStatus({
    required bool profileVerificationStatus,
  }) async {
    try {
      await _storage.write(
        key: _profileVerifiedKey,
        value: profileVerificationStatus.toString(),
      );
      _profileVerified = profileVerificationStatus;
    } catch (e) {
      log('Error saving profile verification status: $e');
    }
  }

  static Future<void> saveLanguage({required String language}) async {
    try {
      await _storage.write(key: _languageKey, value: language);
      _language = language;
    } catch (e) {
      log('Error saving language: $e');
    }
  }

  // Clear authentication data (for logout or clearing auth data)
  static Future<void> logoutUser() async {
    try {
      await _storage.deleteAll();

      // Reset cached values (language is kept in memory, as before)
      _token = null;
      _refreshToken = null;
      _id = null;
      _userRole = null;
      _isVerified = null;
      _profileVerified = null;

      // Redirect to the login screen
      //await goToLogin(context: context);
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  // Getters
  static String? get token => _token;
  static String? get refreshToken => _refreshToken;
  static String? get id => _id;
  static String? get role => _userRole;
  static bool? get verificationStatus => _isVerified;
  static bool? get profileComplete => _profileVerified;
  static String? get language => _language;
}
