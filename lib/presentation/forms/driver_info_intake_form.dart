import 'package:flutter/material.dart';
import '/routing/routings.dart';

import 'land_owner_change_form.dart';

import '/app.exports.widgets.dart';

class DriverInfoIntakeForm extends StatelessWidget {
  const DriverInfoIntakeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("ড্রাইভার"),
        actions: const [HomeActionButton()],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const Text('ড্রাইভার'),
              CardTextFormField(
                label: 'ড্রাইভার নামে',
              ),
              CardTextFormField(
                label: 'ড্রাইভার জাতীয় পরিচয়পত্র নম্বর',
              ),
              CardTextFormField(
                label: 'ড্রাইভার মোবাইল নম্বর',
              ),
              // CardTextFormField(
              //   label: 'ড্রাইভার স্থায়ী ঠিকানা',
              // ),
              AddressTextFormField(labelText: 'ড্রাইভার স্থায়ী ঠিকানা'),
              // CardTextFormField(
              //   label: 'ড্রাইভার স্থায়ী ঠিকানা',
              // ),
              Divider(),
              Text('ড্রাইভার NID'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImagePickerBox(iconData: Icons.add_a_photo_outlined),
                  ImagePickerBox(iconData: Icons.add_photo_alternate_outlined),
                ],
              ),
              SizedBox(height: 15),
              Text('ড্রাইভার Picture'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImagePickerBox(iconData: Icons.add_a_photo_outlined),
                  ImagePickerBox(iconData: Icons.add_photo_alternate_outlined),
                ],
              ),
              SizedBox(height: 15),
              Text('ড্রাইভার Licence Picture'),
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
        onNextButtonPress: () {
          Navigator.pushNamed(context, Routes.instance.helpingHandInfoForm);
        },
        onPreviousButtonPress: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
