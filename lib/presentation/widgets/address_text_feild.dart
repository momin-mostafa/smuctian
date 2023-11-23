import 'package:flutter/material.dart';
import 'package:smuctian/app.exports.widgets.dart';
import 'package:smuctian/routing/routings.dart';

class AddressTextFormField extends StatefulWidget {
  const AddressTextFormField({
    super.key,
    this.mapOnPressed,
    this.labelText = "Address",
  });

  final String labelText;
  final void Function()? mapOnPressed;

  @override
  State<AddressTextFormField> createState() => _AddressTextFormFieldState();
}

class _AddressTextFormFieldState extends State<AddressTextFormField> {
  List<String> locationList = ['--', 'Dhaka', 'Rajshahi'];

  List<String> locationList2 = ['--', 'Bogura', 'Gabtoli'];

  List<String> locationList3 = ['--', 'Sath matha', 'Jolesswori Tola'];

  String selectedLocation = '--';

  String selectedLocation2 = '--';

  String selectedLocation3 = '--';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:
          Theme.of(context).copyWith(dividerColor: Theme.of(context).cardColor),
      child: Card(
        child: ExpansionTile(
          title: const Text('Address'),
          subtitle: const Text('Bogura, Bogura Sadar, Chalk Farid Colony'),
          controlAffinity: ListTileControlAffinity.trailing,
          children: <Widget>[
            AddressField(labelText: widget.labelText),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Division',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomDropDown(
                      values: locationList,
                      onChange: (String value) {
                        setState(() {
                          selectedLocation = value;
                        });
                      },
                      initialValue: locationList[0],
                    ),
                    Text(
                      'District',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomDropDown(
                      values: locationList2,
                      onChange: (String value) {
                        setState(() {
                          selectedLocation2 = value;
                        });
                      },
                      initialValue: locationList2[0],
                    ),
                    Text(
                      'Thana',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomDropDown(
                      values: locationList3,
                      onChange: (String value) {
                        setState(() {
                          selectedLocation3 = value;
                        });
                      },
                      initialValue: locationList3[0],
                    ),
                    Text(
                      'Union',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomDropDown(
                      values: locationList3,
                      onChange: (String value) {
                        setState(() {
                          selectedLocation3 = value;
                        });
                      },
                      initialValue: locationList3[0],
                    ),
                    Text(
                      'Gram',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomDropDown(
                      values: locationList3,
                      onChange: (String value) {
                        setState(() {
                          selectedLocation3 = value;
                        });
                      },
                      initialValue: locationList3[0],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({super.key, this.labelText});

  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white54,
        labelText: labelText,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconButton(
            tooltip: "Select in google map",
            icon: const Icon(
              Icons.map_outlined,
              color: Colors.black,
            ),
            onPressed: //mapOnPressed ??
                () {
              Navigator.pushNamed(context, Routes.instance.map);
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 1.0,
                color: Theme.of(context).primaryColor,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
