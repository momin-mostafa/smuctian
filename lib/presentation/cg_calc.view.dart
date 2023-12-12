import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smuctian/application/cgcalc/cgcalc.provider.dart';

class CGCalcView extends StatelessWidget {
  const CGCalcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CGCalcView"),
      ),
      body: Consumer<CGCalcProvider>(
        builder: (context,vm,_) {
          return Column(
            children: [
              TextFormField(
                controller: vm.registrationPageModelTwo.newIntakeCredit,
              ),
              TextFormField(
                controller: vm.registrationPageModelTwo.previousSemesterResult,
              ),
              TextFormField(
                controller: vm.registrationPageModelTwo.prevTotalRegisteredCredit,
              ),
              TextFormField(
                controller: vm.registrationPageModelTwo.retakeCredit,
              ),
              const Divider(),
              TextFormField(
                controller: vm.registrationPageModelOne.id,
              ),
              TextFormField(
                controller: vm.registrationPageModelOne.name,
              ),
              TextFormField(
                controller: vm.registrationPageModelOne.departmentName,
              ),
              TextFormField(
                controller: vm.registrationPageModelOne.sscResult,
              ),
              TextFormField(
                controller: vm.registrationPageModelOne.hscResult,
              ),
            ],
          );
        }
      ),
    );
  }
}
