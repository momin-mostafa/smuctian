import 'package:flutter/material.dart';

class CardTextFormField extends StatelessWidget {
  const CardTextFormField({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(

      // padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
        ),
      ),
    );
  }
}
