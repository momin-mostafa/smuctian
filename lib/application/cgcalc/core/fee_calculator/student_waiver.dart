import 'package:smuctian/application/cgcalc/core/fee_calculator/highest_waiver.dart';
import 'package:smuctian/application/cgcalc/core/fee_calculator/ssc_hsc_based_scholarship.dart';
import 'package:smuctian/data/fee_calculator_models.dart';

class StudentWaiverController {
  var data = StudentDataModel();
  double _total = 0;
  // double _totalCredit = 0;
  StudentWaiverController({
    required double previousSemesterResult,
    required List<double> listOfAvailableWaiver,
    required double sscResult,
    required double hscResult,
    required double prevTotalRegisteredCredit,
    required double newIntakeCredit,
    required double retakeCredit,
    double additionalWaiver = 0,
    bool sscGolden = false,
    bool hscGolden = false,
  }) {
    // init
    data.prevResults = previousSemesterResult;
    // data.prevSemesterBasedScholarship
    data.highestWaiver = Waiver(listOfAvailableWaiver).highesetWaiver();
    data.sscResult = sscResult;
    data.hscResult = hscResult;
    data.sscHscResultsBasedScholarship = SscHscScholarship(
      hsc: hscResult,
      sscGolden: sscGolden,
      hscGolden: hscGolden,
      ssc: sscResult,
    ).getSchollarship();
    data.prevTotalCredit = prevTotalRegisteredCredit;
    // data.prevNewIntake = newIntakeCredit;
    data.retakeCredit = retakeCredit;
    data.additionalWaiver = additionalWaiver;

    _initialLogicImplemntation();
    _totalMoreThanHundredCheck();
  }
  void _initialLogicImplemntation() {
    if (data.prevResults >= 3) {
      //if newIntake is more than 9 credit.
      if (_moreThanNineCredit()) {
        if (data.highestWaiver > data.sscHscResultsBasedScholarship) {
          _total = data.highestWaiver;
        } else if (data.highestWaiver < data.sscHscResultsBasedScholarship) {
          _total = data.sscHscResultsBasedScholarship;
        } else {
          _total = data.highestWaiver;
        }
      }
    } else {
      _total = 0;
    }
  }

  void _totalMoreThanHundredCheck() {
    if (_total >= 100) {
      _total = 100;
    } else if (_total < 100) {
      _total += data.additionalWaiver;
    }
  }

  bool _moreThanNineCredit() {
    data.prevNewIntake = data.prevTotalCredit - data.retakeCredit;
    if (data.prevNewIntake >= 9) {
      return true;
    }
    return false;
  }

  double getTotalWaiver() {
    return _total;
  }
}
