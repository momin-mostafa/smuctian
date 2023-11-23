
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smuctian/domain/auth/user_auth.dart';

import 'http_service.dart';

class AuthService {
  final HttpService httpService = HttpService();

  AuthService();

  Future<UserAuthModel?> login(
      String phoneNumber,
      String phoneCode,
      String password,
      String medium,
      ) async {
    final data = {
      'phone_number': phoneNumber,
      'phone_code': phoneCode,
      'password': password,
      'medium': medium,
    };
    Map<String, dynamic>? response;
    try{
      response = await httpService.post('user/login', data);
      return UserAuthModel.fromJson(response);
    }catch(e){
      log('Parse Error : UserAuthModel',error: 'UserAuthModel');
    }
  }

  Future<Map<String, dynamic>?> signup(
      String phoneNumber,
      String phoneCode,
      String password,
      String medium,
      ) async {
    final data = {
      'phone_number': phoneNumber,
      'phone_code': phoneCode,
      'password': password,
      'medium': medium,
    };
    try{
      final response = await httpService.post('signup', data);
      return response;
    }catch(e){
      final response = await httpService.post('signup', data);
    }
  }

  Future<void> logout() async {
    // Perform logout operations like clearing tokens or user data
  }
}

// Example usage:
// void main() {
//   final authService = AuthService(HttpService('https://example.com/auth'));
//
//   // Log in
//   authService
//       .login('1983447997', '+880', '12345678', 'password')
//       .then((response) {
//     // Handle login response
//   });
//
//   // Sign up
//   authService
//       .signup('1983447997', '+880', '12345678', 'password')
//       .then((response) {
//     // Handle signup response
//   });
//
//   // Log out
//   authService.logout();
// }
