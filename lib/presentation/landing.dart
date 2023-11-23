import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '/routing/routings.dart';
import '/styles.dart';


class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/background.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Welcome To Tenant Management",
                  style: AppStyle.headingTextStyle,
                ),
                Text(
                  'Manage all tenants from single place',
                  style: AppStyle.subHeaderTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                DotsIndicator(dotsCount: 4),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          Navigator.popAndPushNamed(
            context,
            Routes.instance.login
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
