import 'package:flutter/material.dart';

class FlatView extends StatelessWidget {
  const FlatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flat Info Intake Form'),),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Id"
            ),
          )
        ],
      ),
    );
  }
}
