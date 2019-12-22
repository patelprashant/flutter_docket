import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'docket.dart';

class DocketData extends ChangeNotifier {
  List<Docket> _dockets = [
    Docket(name: "My First Docket"),
    Docket(name: "My Second Docket"),
    Docket(name: "My Third Docket"),
    Docket(name: "My Fourth Docket"),
  ];

  UnmodifiableListView<Docket> get dockets {
    return UnmodifiableListView(_dockets);
  }

  int get docketCounts {
    return _dockets.length;
  }

  int get docketDoneCounts {
    List<Docket> doneDockets = _dockets.where((d) => d.isDone).toList();
    return doneDockets.length;
  }

  void addDocket(String docketTitle) {
    final Docket newDocket = Docket(name: docketTitle);
    _dockets.add(newDocket);
    notifyListeners();
  }

  void updateDocket(Docket docket) {
    docket.toggleDone();
    notifyListeners();
  }

  void deleteDocket(Docket docket) {
    _dockets.remove(docket);
    notifyListeners();
  }
}
