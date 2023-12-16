import 'package:flutter/material.dart';
import 'package:smuctian/routing/routings.dart';

class LoginProvider extends ChangeNotifier {
  // AuthService authService = AuthService();
  LoginState uiState = LoginState();
  void login(context) async {
    // UserAuthModel? model = await authService.login(
    //     uiState.phoneNumber.text, uiState.countryCode.text, uiState.otp.text, 'password');
    // if (model == null) {
    //  print('object');
    //   return;
    // }
    // //local DB init
    // GlobalAppSingleton.instance.token = model.token;
    // print(model.token);
    Navigator.pushNamed(context, Routes.instance.home);
  }
}

class LoginState{
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController countryCode = TextEditingController();
  final TextEditingController otp = TextEditingController();

}