import 'package:flutter/material.dart';
import '/routing/routings.dart';

class SubletMemberView extends StatelessWidget {
  const SubletMemberView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sublet Members'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.instance.addProfile);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                ListTile(
                  title: const Text('Md Al Momin Mostafa'),
                  subtitle: const Text('Profile ID : 001'),
                  trailing: IconButton(
                    onPressed: () {},
                    tooltip: 'Release This Member',
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
