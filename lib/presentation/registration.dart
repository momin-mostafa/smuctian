import 'package:flutter/material.dart';
import '/styles.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.4),
              Theme.of(context).primaryColor.withOpacity(0.7),
            ],
          ),
        ),
        child: Image.network(
            'https://images.pexels.com/photos/4322027/pexels-photo-4322027.jpeg?auto=compress&cs=tinysrgb&w=800'),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SIGN UP",
                  style: AppStyle.headingTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Card(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  label: Text("Email"),
                ),
              ),
            ),
            const Card(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                  ),
                  label: Text("Phone Number"),
                ),
              ),
            ),
            const Card(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.password,
                  ),
                  label: Text("Password"),
                ),
              ),
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () {},
              style: const ButtonStyle().copyWith(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              child: const Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
