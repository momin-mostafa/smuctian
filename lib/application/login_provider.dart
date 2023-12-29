import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smuctian/data/remote/login_service.dart';
import 'package:smuctian/domain/global_singleton.dart';
import 'package:smuctian/routing/routings.dart';

class LoginProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  LoginState uiState = LoginState();

  void login(BuildContext context) async {
    await authService
        .login(
      academicId: uiState.academicId.text.trim(),
      password: uiState.password.text.trim(),
    )
        .then((value) {
      Fluttertoast.showToast(msg: "${value?.message}", timeInSecForIosWeb: 5);
      // print(value?.message);
      if (value != null) {
        GlobalAppSingleton.instance.setToken(value.data);
        Navigator.pushNamed(context, Routes.instance.home);
        log(GlobalAppSingleton.instance.getToken,name: "LoginProvider.login -> setToken");
      }
    });

    // UserAuthModel? model = authService.login(
    //     uiState.academicId.text, uiState.password.text);
    // if (model == null) {
    //  print('object');
    //   return;
    // }
    // //local DB init
    // GlobalAppSingleton.instance.token = model.token;
    // print(model.token);
  }
}

class LoginState {
  final TextEditingController academicId = TextEditingController(text: "230110210001");

  // final TextEditingController countryCode = TextEditingController();
  final TextEditingController password = TextEditingController(text: "12345");
}
