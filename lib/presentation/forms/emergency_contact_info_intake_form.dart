import 'package:flutter/material.dart';
import '/routing/routings.dart';


import '/app.exports.widgets.dart';

class EmergencyContactInfoIntakeForm extends StatelessWidget {
  const EmergencyContactInfoIntakeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("জরুরী যোগাযোগ"),
        actions: const [HomeActionButton()],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const Text('জরুরী যোগাযোগ'),
              CardTextFormField(label: 'নাম'),
              CardTextFormField(label: 'সম্পর্ক'),
              // CardTextFormField(label: 'ঠিকানা'),
              AddressTextFormField(labelText: 'ঠিকানা'),
              CardTextFormField(label: 'মোবাইল নম্বর'),
              Divider(),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomSheet: FormBottomSheet(
        onNextButtonPress: (){
          Navigator.pushNamed(
            context,
            Routes.instance.memberInfoForm
          );
        },
        onPreviousButtonPress: (){
          Navigator.pop(context);
        },
      ),

    );
  }
}
