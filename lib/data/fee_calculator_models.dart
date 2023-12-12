import 'package:flutter/material.dart';

class DataModel {
  // used for cost controller.
  double total = 0;
  double waiver = 0;
  double finalAmmount = 0;
  double regFee = 0;
  double mid = 0;
  double finalfee = 0;
  double regAndTotal = 0;
  double additionalWaiver = 0;
}

/// Student model incomplete.
class StudentDataModel {
  double prevResults = 0.0;
  double prevTotalCredit = 0.0;
  double highestWaiver = 0.0;
  double prevNewIntake = 0.0;
  double sscResult = 0.0;
  double hscResult = 0.0;
  double sscHscResultsBasedScholarship = 0.0;
  double totalWaiver = 0;
  double totalScholarship = 0;
  double retakeCredit = 0;
  double additionalWaiver = 0;

  //future feature.
  // double studentTotalSemesterFee = 0.0;  //for other departments.
  // List availableWaiverPercentage = [0.0]; // have to use Sigle
  // double prevSemesterBasedScholarship // for semester final based scholarship
}

class RegistrationPageModelOne {
  final id = TextEditingController();
  final name = TextEditingController();
  final departmentName = TextEditingController();
  final sscResult = TextEditingController();
  final hscResult = TextEditingController();
}

class RegistrationPageModelTwo {
  final previousSemesterResult = TextEditingController();
  final newIntakeCredit = TextEditingController();
  final prevTotalRegisteredCredit = TextEditingController();
  final retakeCredit = TextEditingController();
}
