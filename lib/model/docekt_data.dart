import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'docket.dart';

class DocketData extends ChangeNotifier {
  List<Docket> _dockets = [
    Docket(name: "My First Task"),
    Docket(name: "My Second Task"),
    Docket(name: "My Third Task"),
    Docket(name: "My Fourth Task"),
  ];

  UnmodifiableListView<Docket> get dockets {
    return UnmodifiableListView(_dockets);
  }

  int get docketCounts {
    return _dockets.length;
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
}
