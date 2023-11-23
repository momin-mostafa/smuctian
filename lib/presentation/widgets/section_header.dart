import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, this.label = '', this.onTap});
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(onPressed: onTap, child: const Text('See All'))
      ],
    );
  }
}
