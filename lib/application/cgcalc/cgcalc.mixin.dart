import 'package:smuctian/application/cgcalc/core/fee_calculator/cost_controller.dart';

abstract class CGCalcService {
  set data(CostCalculationFeature costCalculationFeature);
  CostCalculationFeature get data;
}

