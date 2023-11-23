import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
        required this.values,
        required this.onChange,
        required this.initialValue});

  final List<String> values;
  final String initialValue;
  final void Function(String value) onChange;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  String? selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selected,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: widget.values.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selected = newValue!;
        });
        widget.onChange(newValue ?? '');
      },
    );
  }
}
