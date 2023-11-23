import 'package:flutter/material.dart';
// import '/data/api/profile_service.dart';
// import '/domain/profile/user_profile_singleton.dart';
import '/styles.dart';
import '/app.exports.widgets.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor.withOpacity(0.8);
    var secondaryColor = Theme.of(context).cardColor;
    double radius = 30;
    return Stack(
      children: [
        ProfileScaffold(
            name: "Tamim Mostafa",
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            radius: radius,
            // profileID: '1',
            imageUrl:
                'https://images.pexels.com/photos/5791753/pexels-photo-5791753.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              primary: false,
              children: [
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Profile ID'),
                  subtitle: const Text('001'),
                )),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Email'),
                  subtitle: const Text('mominmostafa.g@outlook.com'),
                )),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Father Name'),
                  subtitle: const Text('Mr. Anis Mostafa'),
                )),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Mother Name'),
                  subtitle: const Text('Mrs. Mostafa'),
                )),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Permanent Address'),
                  subtitle: const Text('Bogura'),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Emergency Contact',
                    style: AppStyle.headingTextStyle,
                  ),
                ),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Name'),
                  subtitle: const Text('Al Amin Mostafa'),
                )),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Relation'),
                  subtitle: const Text('Brother'),
                )),
                Card(
                    child: ListTile(
                  onTap: () {},
                  title: const Text('Phone Number'),
                  subtitle: const Text('019XXXXXXX'),
                )),
                const SizedBox(height: 40),
              ],
            )),
        Positioned(
          top: 50,
          left: 10,
          child: IconButton.filled(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}
