import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smuctian/application/cgcalc/core/fee_calculator/cost_controller.dart';
import 'package:smuctian/data/fee_calculator_models.dart';

class CGCalcProvider with ChangeNotifier, CGPACalculation {
  RegistrationPageModelOne registrationPageModelOne =
      RegistrationPageModelOne();
  RegistrationPageModelTwo registrationPageModelTwo =
      RegistrationPageModelTwo();

  late CostCalculationFeature costCalculation;

  double semesterFeeTotal = 18400;
  double registrationFeeTotal = 2000;
  double previousSemesterResult = 3.9;
  List<double> listOfAvailableWaiver = [1, 30];
  double sscResult = 4.68;
  double hscResult = 4.33;
  double prevTotalRegisteredCredit = 18.0;
  double newIntakeCredit = 12;
  double retakeCredit = 0;
  bool sscGolden = false;
  bool hscGolden = false;

  CostCalculationFeature get cost => costCalculation;

  String get amount => cost.getFinalAmmount().toString();

  String get highestWaiver => cost.getWaiver().toString();

  void calculate() {
    costCalculation = CostCalculationFeature(
        semesterfeeTotal: semesterFeeTotal,
        registrationFee: registrationFeeTotal,
        previousSemesterResult: previousSemesterResult,
        listOfAvailableWaiver: listOfAvailableWaiver,
        sscResult: sscResult,
        hscResult: hscResult,
        prevTotalRegisteredCredit: prevTotalRegisteredCredit,
        newIntakeCredit: newIntakeCredit,
        retakeCredit: retakeCredit);
  }

  void addCG() {
    listOfField = addTextField();
    notifyListeners();
  }
  
  void showResult(){
    var message = calculateCgpa();
    EasyLoading.showToast(message);
    notifyListeners();
  }
}

mixin class CGPACalculation {
  List<Widget> listOfField = [];
  List<SingleClassState> listOfState = [];

  int cgpa = 0;

  List<Widget> addTextField() {
    var state = SingleClassState();

    listOfField.add(SingleSubject(controller: state));
    listOfState.add(state);
    return listOfField;
  }

String  calculateCgpa() {
    double totalGradePoint = 0;
    double totalHour = 0;
    double tempCgpa = 0;
    for (var element in listOfState) {
      double cg = double.tryParse(element.cgpaController.text) ?? 0;
      double creditHour = double.tryParse(element.creditHourController.text) ?? 0;
      double cgXcreditHour = cg * creditHour;
      totalGradePoint += cgXcreditHour;
      totalHour += creditHour;
    }

    tempCgpa = totalGradePoint/totalHour;
    return tempCgpa.toStringAsFixed(2);
  }
}

class SingleSubject extends StatefulWidget {
  const SingleSubject({super.key, required this.controller});

  final SingleClassState controller;

  @override
  State<SingleSubject> createState() => _SingleSubjectState();
}

class _SingleSubjectState extends State<SingleSubject> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Text("CGPA"),
            title: TextFormField(
              controller: widget.controller.cgpaController,
            ),
            trailing: IconButton(
              onPressed: () {
                widget.controller.cgpaController.clear();
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Text("Credit Hour"),
            title: TextFormField(
              controller: widget.controller.creditHourController,
            ),
            trailing: IconButton(
              onPressed: () {
                widget.controller.creditHourController.clear();
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SingleClassState {
  final TextEditingController cgpaController = TextEditingController();
  final TextEditingController creditHourController = TextEditingController();
}
