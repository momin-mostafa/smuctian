import 'package:flutter/cupertino.dart';
import 'package:smuctian/application/cgcalc/core/fee_calculator/cost_controller.dart';
import 'package:smuctian/data/fee_calculator_models.dart';

class CGCalcProvider with ChangeNotifier {
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


  void calculate(){
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
}
