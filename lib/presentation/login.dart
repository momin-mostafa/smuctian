import 'package:flutter/material.dart';
import 'package:smuctian/application/login_provider.dart';
import '/routing/routings.dart';
import '/styles.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter Your ID',
                style: AppStyle.loginHeaderTextField,
              ),
              const Text('We will send you a confirmation code'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     color: Theme.of(context).primaryColor.withOpacity(0.1),
                  //   ),
                  //   width: MediaQuery.of(context).size.width * 0.3,
                  //   child: TextField(
                  //     controller: context.read<LoginProvider>().uiState.countryCode,
                  //     decoration: const InputDecoration(
                  //       hintText: '+880',
                  //       hintStyle: TextStyle(fontSize: 20),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 2),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller:context.read<LoginProvider>().uiState.phoneNumber,
                      decoration: const InputDecoration(
                        hintText: '1963061001',
                        hintStyle: TextStyle(fontSize: 20),
                        // labelText: "ID",
                      ),
                    ),
                  ),
                  // CountryCodePicker()
                ],
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {
                  print(context.read<LoginProvider>().uiState.countryCode.text);
                  print(context.read<LoginProvider>().uiState.phoneNumber.text);
                  // provider.notifyListeners();
                  Navigator.pushNamed(context, Routes.instance.otp);
                },
                child: const Text('Next'),
              ),
              const SizedBox(height: 10),
              const Text(
                  'By clicking loging you are agreeing to our terms and policy'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.language),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
