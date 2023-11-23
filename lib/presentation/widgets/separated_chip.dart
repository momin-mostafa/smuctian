import 'package:flutter/material.dart';

class SeparatedChip extends StatelessWidget {
  const SeparatedChip({super.key, required this.icon, required this.label});
final IconData icon;
final String label;
  @override
  Widget build(BuildContext context) {
    return
      Row(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ),
        ),
      ],);
  }
}
