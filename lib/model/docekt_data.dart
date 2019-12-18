import 'package:flutter/foundation.dart';

import 'docket.dart';

class DocketData extends ChangeNotifier {
  List<Docket> dockets = [
    Docket(name: "My First Task"),
    Docket(name: "My Second Task"),
    Docket(name: "My Third Task"),
    Docket(name: "My Fourth Task"),
  ];
}
