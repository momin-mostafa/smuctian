import 'package:shared_preferences/shared_preferences.dart';
import 'package:smuctian/app_const.dart';

mixin class TokenHandling {
  String token = '';

  Future<void> saveTokenToLocalAndUpdate(
      SharedPreferences sharedPreferences, String? newToken) async {
    token = newToken ?? '';
    await sharedPreferences.setString(SharedPrefKeys.tokenKey, token);
  }

  Future<void> deleteTokenToLocalAndUpdate(
      SharedPreferences sharedPreferences) async {
    token = '';
    await sharedPreferences.setString(SharedPrefKeys.tokenKey, '');
  }

  Future<void> updateTokenToLocalAndUpdate(
      SharedPreferences sharedPreferences, String newToken) async {
    token = newToken;
    await sharedPreferences.setString(SharedPrefKeys.tokenKey, token);
  }

  Future<void> getTokenFromLocalAndUpdate(
      SharedPreferences sharedPreferences,
      ) async {
    token = sharedPreferences.getString(SharedPrefKeys.tokenKey) ?? '';
  }
}