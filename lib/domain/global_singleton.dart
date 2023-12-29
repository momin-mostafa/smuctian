import 'package:shared_preferences/shared_preferences.dart';
import 'package:smuctian/domain/token_handler.dart';

class GlobalAppSingleton with TokenHandling {
  late SharedPreferences sharedPreferences;

  static var instance = GlobalAppSingleton._();

  GlobalAppSingleton._();

  factory GlobalAppSingleton() => instance;


  String academicId = '';
  String institutionCode = '';
  String userId = '';


  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await getTokenFromLocalAndUpdate(sharedPreferences);
  }

  Future<void> setToken(String? newToken) async {
    await saveTokenToLocalAndUpdate(sharedPreferences, newToken);
  }

  Future<void> updateToken(String newToken) async {
    await updateTokenToLocalAndUpdate(sharedPreferences, token);
  }

  Future<void> removeToken() async {
    await deleteTokenToLocalAndUpdate(sharedPreferences);
  }

  String get getToken => token;

}



