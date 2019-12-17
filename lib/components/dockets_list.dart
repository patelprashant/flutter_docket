import 'package:flutter/material.dart';
import 'package:flutter_docket/model/docket.dart';

import 'docket_tile.dart';

class DocketsList extends StatefulWidget {
  final List<Docket> dockets;

  const DocketsList(this.dockets);

  @override
  _DocketsListState createState() => _DocketsListState();
}

class _DocketsListState extends State<DocketsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return DocketTile(
          docketTitle: widget.dockets[index].name,
          isDocketDone: widget.dockets[index].isDone,
          docketCallback: (docketState) {
//            debugPrint(dockets[index].name);
            setState(() {
              widget.dockets[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.dockets.length,
    );
  }
}
