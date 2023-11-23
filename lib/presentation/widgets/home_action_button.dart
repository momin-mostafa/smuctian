import 'package:flutter/material.dart';
import 'package:smuctian/routing/routings.dart';

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () {
        Navigator.popUntil(
          context,
          ModalRoute.withName(Routes.instance.home),
        );
      },
      icon: Icon(
        Icons.home,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
