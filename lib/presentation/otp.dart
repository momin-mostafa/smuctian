import 'package:flutter/material.dart';
import 'package:smuctian/application/login_provider.dart';

// import '/application/login_provider.dart';
import '/routing/routings.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';
import '/styles.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

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
                'OTP Verification Screen',
                style: AppStyle.loginHeaderTextField,
              ),
              Text(
                  'Enter OTP code sent to ${context.read<LoginProvider>().uiState.countryCode.text} ${context.read<LoginProvider>().uiState.phoneNumber.text}'),
              const SizedBox(height: 20),
              // const TextField(
              //   decoration: InputDecoration(
              //     hintText: '+880 1996304242',
              //     hintStyle: TextStyle(fontSize: 28),
              //   ),
              // ),
              Pinput(
                controller: context.read<LoginProvider>().uiState.otp,
                length: 5,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  context.read<LoginProvider>().login(context);
                },
                child: const Text('Next'),
              ),
              const SizedBox(height: 10),
              const Text(
                  'By clicking next you are agreeing to our terms and policy'),
            ],
          ),
        ),
      ),
    );
  }
}
