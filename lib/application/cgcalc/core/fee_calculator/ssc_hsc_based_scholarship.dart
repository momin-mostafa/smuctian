//for non fdt & AMMT dept
class SscHscScholarship {
  double _total = 0;
  double _avg = 0;
  double _waiver = 0;
  bool sscGolden = false;
  bool hscGolden = false;
  SscHscScholarship({
    double hsc = 0,
    double ssc = 0,
    this.sscGolden = false,
    this.hscGolden = false,
  }) {
    waiverCounter(sscHscAvg(hsc, ssc));
  }

  double sscHscAvg(double hsc, double ssc) {
    _total = hsc + ssc;
    _avg = _total / 2;
    return _avg;
  }

  double waiverCounter(double avg) {
    double _avg = avg;
    if (_avg >= 3 && _avg <= 3.99) {
      _waiver = 10;
    } else if (_avg >= 4 && _avg <= 4.49) {
      _waiver = 20;
    } else if (_avg >= 4.5 && _avg <= 4.99) {
      _waiver = 30;
    } else if (_avg >= 5) {
      if (_twoGolden()) {
        _waiver = 100;
      } else if (_oneGolden() || !_oneGolden()) {
        _waiver = 60;
      }
    }
    return _waiver;
  }

  bool _twoGolden() {
    return sscGolden && hscGolden;
  }

  bool _oneGolden() {
    // if only hsc golden counts then edit below code.
    if (sscGolden || hscGolden) {
      return true;
    }
    return false;
  }

  double getSchollarship() {
    return _waiver;
  }
}
