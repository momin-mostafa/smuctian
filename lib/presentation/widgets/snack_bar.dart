import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    //   Center(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       final snackBar = ;
    //
    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     },
    //     child: const Text('Show SnackBar'),
    //   ),
    // );
  }
}