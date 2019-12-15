import 'package:flutter/material.dart';
import 'package:flutter_docket/model/docket.dart';

import 'docket_tile.dart';

class DocketsList extends StatefulWidget {
  @override
  _DocketsListState createState() => _DocketsListState();
}

class _DocketsListState extends State<DocketsList> {
  List<Docket> dockets = [
    Docket(name: "My First Task"),
    Docket(name: "My Second Task"),
    Docket(name: "My Third Task"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return DocketTile(
          docketTitle: dockets[index].name,
          isDocketDone: dockets[index].isDone,
          docketCallback: (docketState) {
//            debugPrint(dockets[index].name);
            setState(() {
              dockets[index].toggleDone();
            });
          },
        );
      },
      itemCount: dockets.length,
    );
  }
}
