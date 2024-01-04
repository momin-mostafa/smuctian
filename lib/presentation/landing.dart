import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '/routing/routings.dart';
import '/styles.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF1C5D99),
        child: Container(
          color: Colors.white.withOpacity(0.3),
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
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Welcome To SMUCTian",
                  style: AppStyle.headingTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  'Shaping Minds, Building Futures, Igniting Innovation',
                  style: AppStyle.subHeaderTextStyle,
                  textAlign: TextAlign.center,
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
        heroTag: 'll',
        onPressed: () async {
          Navigator.popAndPushNamed(context, Routes.instance.login);
        },
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
