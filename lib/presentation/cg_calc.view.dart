import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smuctian/application/cgcalc/cgcalc.provider.dart';

class CGCalcView extends StatelessWidget {
  const CGCalcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CGCalcProvider>(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("CGCalcView"),
            actions: [
              FilledButton.tonalIcon(
                icon: const Icon(Icons.add),
                onPressed: () => vm.addCG(), label: const Text("Add"),
              ),
            ],
          ),
          body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => vm.listOfField[index],
            itemCount: vm.listOfField.length,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => vm.showResult(),
            label: const Text("Calculate"),
            icon: const Icon(Icons.calculate_outlined),
          ),
        );
      },
    );
  }
}
//           )
