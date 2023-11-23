import 'package:flutter/material.dart';

class ImagePickerBox extends StatelessWidget {
  const ImagePickerBox({super.key, required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).focusColor,
        ),
      ),
      height: 100,
      width: 100,
      child: Center(
        child: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
          size: 20,

        ),
      ),
    );
  }
}
