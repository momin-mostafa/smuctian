import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';

class MemberAddForm extends StatelessWidget {
  const MemberAddForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Member Info'),
        actions: const [HomeActionButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CardTextFormField(label: 'Name'),
            const CardTextFormField(label: 'Phone'),
            const CardTextFormField(label: 'Age'),
            const CardTextFormField(label: 'Occupation'),
            const SizedBox(height: 15),
            FilledButton(onPressed: () {}, child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
