import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';


class HelpingHandInfoIntakeForm extends StatelessWidget {
  const HelpingHandInfoIntakeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("গৃহকর্মী"),
        actions: const [HomeActionButton()],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardTextFormField(label: 'গৃহকর্মীর Profile ID'),
              CardTextFormField(label: 'গৃহকর্মীর নামে'),
              CardTextFormField(label: 'গৃহকর্মীর জাতীয় পরিচয়পত্র নম্বর'),
              CardTextFormField(label: 'গৃহকর্মীর মোবাইল নম্বর'),
              // CardTextFormField(label: 'গৃহকর্মীর স্থায়ী ঠিকানা'),
              AddressTextFormField(labelText: 'গৃহকর্মীর স্থায়ী ঠিকানা'),
              SizedBox(height: 15),
              Divider(),
              Text('গৃহকর্মীর NID'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImagePickerBox(iconData: Icons.add_a_photo_outlined),
                  ImagePickerBox(iconData: Icons.add_photo_alternate_outlined),
                ],
              ),
              SizedBox(height: 15),
              Text('গৃহকর্মীর Picture'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImagePickerBox(iconData: Icons.add_a_photo_outlined),
                  ImagePickerBox(iconData: Icons.add_photo_alternate_outlined),
                ],
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomSheet: FormBottomSheet(
        child: FilledButton(onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        }, child: const Text('Save'),),
      ),
    );
  }
}
