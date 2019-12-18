import 'package:flutter/material.dart';
import 'package:flutter_docket/model/docekt_data.dart';
import 'package:provider/provider.dart';

import 'docket_tile.dart';

class DocketsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return DocketTile(
          docketTitle: Provider.of<DocketData>(context).dockets[index].name,
          isDocketDone: Provider.of<DocketData>(context).dockets[index].isDone,
          docketCallback: (docketState) {
//            debugPrint(dockets[index].name);
            // setState(() {
            //   widget.dockets[index].toggleDone();
            // });
          },
        );
      },
      itemCount: Provider.of<DocketData>(context).dockets.length,
    );
  }
}
