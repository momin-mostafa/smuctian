class Waiver {
  double _hightestWaiver = 0;
  Waiver(List<double> list) {
    if (list.isNotEmpty) {
      if (list.length >= 2) {
        for (var waiver in list) {
          if (_hightestWaiver <= waiver) {
            _hightestWaiver = waiver;
          }
        }
      }
      if (list.length == 1) {
        _hightestWaiver = list[0];
      }
    } else {
      _hightestWaiver = 0;
    }
  }
  double highesetWaiver() {
    return _hightestWaiver;
  }
}
