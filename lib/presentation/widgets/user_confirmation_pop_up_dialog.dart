import 'package:flutter/material.dart';
import 'package:smuctian/routing/routings.dart';

void customPop(context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    pageBuilder: (context, animation, anotherAnimation) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          // child: const SizedBox.expand(child: FlutterLogo()),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(height: 10),
                const Column(
                  children: [
                    InformationTile(label: 'Name', data: 'Tamim Mostafa'),
                    InformationTile(label: 'Marital Status', data: 'Single'),
                    // InformationTile(label: 'Age', data: '24'),
                    InformationTile(
                        label: 'Father\'s Name,', data: 'Mr Mostafa'),
                    // InformationTile(label: 'Mother\'s Name,', data: 'Mrs Mostafa'),
                    InformationTile(
                        label: 'Previous Landowner Name,', data: 'Mr. Mostafa'),
                    InformationTile(
                        label: 'Current Landowner Name', data: 'Mr. Mostafa'),
                    InformationTile(
                        label: 'Current Landowner Name', data: 'Mr. Mostafa'),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.instance.driverInfoForm);
                  },
                  child: const Text(''
                      'Add Other Details'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Deny'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Assign'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
    // transitionBuilder: (_, anim, __, child) {
    //   Tween<Offset> tween;
    //   if (anim.status == AnimationStatus.reverse) {
    //     tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
    //   } else {
    //     tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
    //   }
    //
    //   return SlideTransition(
    //     position: tween.animate(anim),
    //     child: FadeTransition(
    //       opacity: anim,
    //       child: child,
    //     ),
    //   );
    // },
  );
}

class InformationTile extends StatelessWidget {
  const InformationTile({super.key, this.label = 'label', this.data = 'data'});

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(label),
        subtitle: Text(data),
      ),
    );
  }
}
