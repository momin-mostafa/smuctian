import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';


import 'unit_list.dart';

class HouseIntake extends StatefulWidget {
  const HouseIntake({super.key});

  @override
  State<HouseIntake> createState() => _HouseIntakeState();
}

class _HouseIntakeState extends State<HouseIntake> {
  var typeList = [
    'Building',
    'Bari',
    'shop',
  ];
  var locationList = [
    'Dhaka',
    'Bogura',
    'Something',
  ];

  var locationList2 = [
    'Bogura Sadar',
    'Gabtoli',
    'Shonatola',
    '...',
  ];
  var locationList3 = [
    'Chalk Farid Colony',
    'Jollesshori Tola',
    'Majhira',
    '...',
  ];

  var selectedType = 'Building';

  var selectedLocation = 'Bogura';
  var selectedLocation2 = 'Bogura Sadar';
  var selectedLocation3 = 'Chalk Farid Colony';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Intake View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CardTextFormField(label: 'Name'),
              const SizedBox(height: 10),
              const AddressTextFormField(),
              
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Type'),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomDropDown(
                          values: typeList,
                          onChange: (String value) {
                            setState(() {
                              selectedType = value;
                            });
                          },
                          initialValue: typeList[0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UnitList(title: 'House Name'),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

