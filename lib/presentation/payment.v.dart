import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smuctian/application/cgcalc/cgcalc.provider.dart';

class PaymentCalcView extends StatelessWidget {
  const PaymentCalcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Calculator"),
      ),
      body: Consumer<CGCalcProvider>(builder: (context, vm, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: const Text("Registration Fee"),
                trailing: Text(vm.registrationFeeTotal.toString()),
              ),
              ListTile(
                title: const Text("Semester Fee"),
                trailing: Text(vm.semesterFeeTotal.toString()),
              ),
              ListTile(
                title: const Text("Waivers Available"),
                subtitle: Text(vm.listOfAvailableWaiver.toString()),
                trailing: Text(vm.highestWaiver),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    "Mid Payment",
                  ),
                  subtitle: Text(
                    vm.cost.getMid().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: FilledButton.tonal(
                    onPressed: () {
                          Fluttertoast.showToast(msg: "Coming Soon");
                    },
                    child: const Text("Bkash"),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    "Total Payment",
                  ),
                  subtitle: Text(
                    vm.amount.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: FilledButton.tonal(
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Coming Soon");
                    },
                    child: const Text("Bkash"),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
