import 'package:flutter/material.dart';

class AlumniView extends StatelessWidget {
  const AlumniView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alumni List"),
      ),
      body:  Column(
        children: [
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: CircleAvatar(),
                  title: Text("Name"),
                  subtitle: Text("Designation"),
                ),
                const ListTile(
                  title: Text("Email"),
                  subtitle: Text("email@smuct.com"),
                ),
                ListTile(
                  title: const Text("Mobile"),
                  trailing: IconButton.filledTonal(onPressed: (){}, icon:const Icon(Icons.call)),
                ),
                // Container(
                //   height: MediaQuery.sizeOf(context).height * 0.2,
                //   width: MediaQuery.sizeOf(context).width,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
