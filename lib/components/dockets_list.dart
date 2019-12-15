import 'package:flutter/material.dart';
import 'package:flutter_docket/components/docket_tile.dart';
import 'package:flutter_docket/model/docket.dart';

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
    return ListView(
      children: <Widget>[
        DocketTile(
          docketTitle: dockets[0].name,
          isDocketDone: dockets[0].isDone,
        ),
        DocketTile(
          docketTitle: dockets[1].name,
          isDocketDone: dockets[1].isDone,
        ),
        DocketTile(
          docketTitle: dockets[2].name,
          isDocketDone: dockets[2].isDone,
        ),
      ],
    );
  }
}
