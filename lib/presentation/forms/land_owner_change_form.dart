import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';

import '../sublet_member_view.dart';
import 'member_add_view.dart';

class LandOwnerChangeForm extends StatefulWidget {
  const LandOwnerChangeForm({super.key});

  @override
  State<LandOwnerChangeForm> createState() => _TenantIntakeForm5State();
}

class _TenantIntakeForm5State extends State<LandOwnerChangeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("পূর্ববর্তী & বর্তমান বাড়িওয়ালার তথ্য"),
        actions: const [HomeActionButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CardTextFormField(label: 'পূর্ববর্তী বাড়িওয়ালার নাম'),
              const CardTextFormField(
                  label: 'পূর্ববর্তী বাড়িওয়ালার মোবাইল নম্বর'),
              // const CardTextFormField(label: 'পূর্ববর্তী বাড়িওয়ালার ঠিকানা'),
              const AddressTextFormField(
                  labelText: 'পূর্ববর্তী বাড়িওয়ালার ঠিকানা'),
              const CardTextFormField(label: 'পূর্ববর্তী বাসা ছাড়ার কারণ'),
              const CardTextFormField(label: 'বর্তমান বাড়িওয়ালার নাম'),
              const CardTextFormField(label: 'বর্তমান বাড়িওয়ালার মোবাইল নম্বর'),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubletMemberView(),
                        ),
                      );
                    },
                    child: const Text('Add Sublet'),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MemberAddForm()),
                      );
                    },
                    child: const Text('Add Member'),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomSheet: FormBottomSheet(
        child: FormBottomSheetButton(
          label: 'Save',
          onTap: () {},
        ),
      ),
    );
  }
}
