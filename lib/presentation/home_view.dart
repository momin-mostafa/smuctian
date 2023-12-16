import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';
import 'house_list.dart';

import 'house_intake.dart';
import 'profile.dart';
import 'settings.dart';

import 'home.dart';

import 'forms/tenant_intake_form.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      // ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Home(),
          AssetList(),
          Profile(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,// add this line
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_class_rounded),
            label: 'Classroom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).focusColor,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: CustomFAB(
        distance: 150,
        children: [
          ActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TenantIntakeForm(),
                ),
              );
            },
            icon: Icon(
              Icons.person_outline,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Faculty Intake',
          ),
          ActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HouseIntake(),
                ),
              );
            },
            icon: Icon(
              Icons.house_outlined,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Course Intake',
          ),
        ],
      ),
      // ExpandableFab(
      //   overlayStyle: ExpandableFabOverlayStyle(
      //     blur: 5,
      //   ),
      //   children: [
      //     FloatingActionButton.extended(
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15)
      //       ),
      //       heroTag: null,
      //       label: const Text('House Info Intake'),
      //       icon: const Icon(Icons.house_outlined),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const AssetList(title: 'Asset List'),
      //           ),
      //         );
      //       },
      //     ),
      //     FloatingActionButton.extended(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(15)
      //       ),
      //       heroTag: null,
      //       label: const Text('Person Info Intake'),
      //       icon: const Icon(Icons.person_outline),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const TenantIntakeForm(),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      // floatingActionButton:
      // FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// class Page3 extends StatelessWidget {
//   const Page3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  DashBoard());
//   }
// }

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
