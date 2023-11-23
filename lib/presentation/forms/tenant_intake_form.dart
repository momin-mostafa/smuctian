import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';
import '/routing/routings.dart';

import 'emergency_contact_info_intake_form.dart';

class TenantIntakeForm extends StatelessWidget {
  const TenantIntakeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("ভাড়াটিয়ার"),
        actions: const [HomeActionButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 160,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ভাড়াটিয়ার এক কপি পাসপোর্ট সাইজ ছবি',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      color: Colors.black.withOpacity(0.6),
                      size: 45,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const CardTextFormField(label: 'ভাড়াটিয়ার নাম'),
              const CardTextFormField(label: 'পিতার নাম'),
              const CardTextFormField(label: 'জন্ম তারিখ'),
              // const CardTextFormField(label: 'স্থায়ী ঠিকানা'),
              AddressTextFormField(mapOnPressed: (){}),
              const CardTextFormField(label: 'ধর্ম'),
              const CardTextFormField(label: 'মোবাইল নম্বর'),
              const CardTextFormField(label: 'জাতীয় পরিচয়পত্র নম্বর'),
              const CardTextFormField(label: 'পাসপোর্ট নম্বর'),
              const Divider(),
              const Text('NID Pictures'),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImagePickerBox(iconData: Icons.photo_camera_front_outlined),
                  ImagePickerBox(iconData: Icons.photo_camera_outlined),
                ],
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomSheet: FormBottomSheet(
        onPreviousButtonPress: (){
          Navigator.pop(context);
        },
        onNextButtonPress: (){
          Navigator.pushNamed(
            context,
            Routes.instance.emergencyInfoForm
          );
        },
      ),
    );
  }
}

